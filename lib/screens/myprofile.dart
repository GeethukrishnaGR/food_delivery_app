import 'dart:io';

import 'package:bitenow/themes/appcolors.dart';
import 'package:bitenow/widget/profilefield.dart';
import 'package:bitenow/widget/profileheader.dart';

import 'package:bitenow/widget/profileimage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class Myprofile extends StatefulWidget {
  const Myprofile({super.key});

  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {

  final supabase = Supabase.instance.client;

  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String imageUrl = "";
  File? imageFile;

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  Future<void> fetchProfile() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    final data = await supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .maybeSingle();

    if (data != null) {
      setState(() {
        nameController.text = data['full_name'] ?? "";
        dobController.text = data['dob'] ?? "";
        emailController.text = data['email'] ?? "";
        phoneController.text = data['phone'] ?? "";
        imageUrl = data['image_url'] ?? "";
      });
    }
  }

  void showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Wrap(
          children: [

            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.camera);
              },
            ),

            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
              onTap: () {
                Navigator.pop(context);
                pickImage(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> pickImage(ImageSource source) async {
    await Permission.camera.request();

    final picked = await picker.pickImage(source: source);

    if (picked == null) return;

    setState(() {
      imageFile = File(picked.path);
    });

    await uploadImage();
  }

  Future<void> uploadImage() async {
    final user = supabase.auth.currentUser;
    if (user == null || imageFile == null) return;

    final fileName = "${user.id}.jpg";

    await supabase.storage
        .from('profile-images')
        .upload(fileName, imageFile!,
            fileOptions: const FileOptions(upsert: true));

    final url = supabase.storage
        .from('profile-images')
        .getPublicUrl(fileName);

    setState(() {
      imageUrl = url;
    });
  }

  Future<void> updateProfile() async {
    final user = supabase.auth.currentUser;
    if (user == null) return;

    await supabase.from('profiles').upsert({
      'id': user.id,
      'full_name': nameController.text,
      'dob': dobController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'image_url': imageUrl,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Updated ✅")),
    );
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [

          const ProfileHeader(name: '', email: '',),

          Expanded(
            child: Container(
              padding: EdgeInsets.all(size.width * 0.05),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),

              child: SingleChildScrollView(
                child: Column(
                  children: [

                    SizedBox(height: size.height * 0.02),

                    ProfileImageWidget(
                      imageFile: imageFile,
                      imageUrl: imageUrl,
                      onTap: showImagePicker,
                    ),

                    SizedBox(height: size.height * 0.03),

                    ProfileField(title: "Full Name", controller: nameController),
                    SizedBox(height: size.height * 0.02),

                    ProfileField(title: "Date of Birth", controller: dobController),
                    SizedBox(height: size.height * 0.02),

                    ProfileField(title: "Email", controller: emailController),
                    SizedBox(height: size.height * 0.02),

                    ProfileField(title: "Mobile Number", controller: phoneController),

                    SizedBox(height: size.height * 0.04),

                    GestureDetector(
                      onTap: updateProfile,
                      child: Container(
                        
                        width: double.infinity,
                        padding: EdgeInsets.all(size.height * 0.02),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Update Profile",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}