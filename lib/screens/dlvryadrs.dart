import 'package:bitenow/screens/addaddress.dart';
import 'package:flutter/material.dart';

class Dlvryadrs extends StatefulWidget {
  const Dlvryadrs({super.key});

  @override
  State<Dlvryadrs> createState() => _DlvryadrsState();
}

class _DlvryadrsState extends State<Dlvryadrs> {
  int selectedIndex = -1;

  List<String> titles = ["My Home", "My Office", "Parents Home"];
  List<String> addresses = ["", "", ""]; // store updated addresses

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
              "Delivery Address",
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

                  /// 🔁 ADDRESS LIST
                  Expanded(
                    child: ListView.builder(
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.home, color: Colors.pink),
                                  const SizedBox(width: 10),

                                  /// TEXT + ADDRESS
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          titles[index],
                                          style: const TextStyle(fontSize: 18),
                                        ),

                                        /// 👇 SHOW UPDATED ADDRESS
                                        if (addresses[index].isNotEmpty)
                                          Text(
                                            addresses[index],
                                            style: const TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),

                                  /// RADIO ICON
                                  Icon(
                                    selectedIndex == index
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_unchecked,
                                    color: Colors.pink,
                                  ),
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

                 
                  GestureDetector(
                    onTap: () async {
                      final newAddress = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddAddress(),
                        ),
                      );

                      if (newAddress != null && selectedIndex != -1) {
                        setState(() {
                          addresses[selectedIndex] = newAddress;
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Add new Address",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
