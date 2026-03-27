import 'dart:io';
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

  /// 🔥 FETCH PROFILE
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
        emailController.text = data['email'] ?? user.email ?? "";
        phoneController.text = data['phone'] ?? "";
        imageUrl = data['image_url'] ?? "";
      });
    }
  }

  /// 🔥 PICK IMAGE OPTIONS
  void showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
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
          ),
        );
      },
    );
  }

  /// 🔥 PICK IMAGE
  Future<void> pickImage(ImageSource source) async {

  // 🔥 REQUEST PERMISSION FIRST
  if (source == ImageSource.camera) {
    await Permission.camera.request();
  } else {
    await Permission.photos.request();
  }

  final picked = await picker.pickImage(source: source);

  if (picked == null) {
    print("No image selected ❌");
    return;
  }

  setState(() {
    imageFile = File(picked.path);
  });

  print("Image selected ✅");

  await uploadImage();
}
  /// 🔥 UPLOAD TO SUPABASE
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

  /// 🔥 UPDATE PROFILE
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

          /// HEADER
          Container(
            height: size.height * 0.16,
            width: double.infinity,
            color: Colors.orange,
            alignment: Alignment.center,
            child: const Text(
              "My Profile",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    const SizedBox(height: 20),

                    /// 🔥 IMAGE + CAMERA
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: imageFile != null
                              ? FileImage(imageFile!)
                              : (imageUrl.isNotEmpty
                                  ? NetworkImage(imageUrl)
                                  : const AssetImage("assets/profile.jpg")
                                      as ImageProvider),
                        ),

                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: showImagePicker,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: const BoxDecoration(
                                color: Colors.deepOrange,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.camera_alt,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    buildField("Full Name", nameController),
                    const SizedBox(height: 15),

                    buildField("Date of Birth", dobController),
                    const SizedBox(height: 15),

                    buildField("Email", emailController),
                    const SizedBox(height: 15),

                    buildField("Mobile Number", phoneController),

                    const SizedBox(height: 30),

                    GestureDetector(
                      onTap: updateProfile,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Update Profile",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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

  /// FIELD
  Widget buildField(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 250, 226, 195),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}