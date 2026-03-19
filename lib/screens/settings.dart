import 'package:bitenow/screens/notificationset.dart';
import 'package:bitenow/screens/passwordset.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int selectedIndex = -1;

  List<String> titles = ["Notification Settings", "Password setting", "Delete account"];
 List<IconData> icons = [
    Icons.notifications,
    Icons.lock,
    Icons.person ,
    
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.16,
            width: double.infinity,
            color: Colors.orange,
            alignment: Alignment.center,
            child: const Text(
              "Settings",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  Expanded(
                    child: ListView.builder(
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                            onTap: () {
  if (index == 0) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Notificationset(),
      ),
    );
  } else if (index == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Passwordset(),
      ),
    );
  } else if (index == 2) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Account"),
        content: const Text("Are you sure you want to delete your account?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Icon(
                                    icons[index],
                                    size: 40,
                                    color: Colors.pink,
                                  ),

                                  /// TEXT + ADDRESS
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          titles[index],
                                          style: const TextStyle(fontSize: 18),
                                        ),

                                     
                                      ],
                                    ),
                                  ),

                                
                                  const Icon(Icons.keyboard_arrow_down, color: Colors.pink),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ),

                            const SizedBox(height: 10),
                            const Divider(color: Colors.pink),
                          ],
                        );
                      },
                    ),
                  ),

                 
                
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
