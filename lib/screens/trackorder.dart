import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
int currentStep = 2;
 
  LatLng userLocation = LatLng(8.8932, 76.6141);

  
  LatLng deliveryLocation = LatLng(8.9000, 76.6200);

  List<String> steps = [
  "Order Accepted",
  "Preparing Food",
  "On the Way",
  "Delivered"
];

List<int> times = [20, 15, 8, 0];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Track Order"),
        backgroundColor: Colors.orange,
      ),

      body: Column(
        children: [

          /// 🗺️ MAP
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: userLocation,
                initialZoom: 13,
              ),
              children: [

                /// MAP TILE
                TileLayer(
                  urlTemplate:
                      "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  userAgentPackageName: 'com.example.bitenow',
                ),

                /// MARKERS
                MarkerLayer(
                  markers: [

                    /// USER LOCATION
                    Marker(
                      point: userLocation,
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.home,
                        color: Colors.green,
                        size: 40,
                      ),
                    ),

                    /// DELIVERY BOY LOCATION
                    Marker(
                      point: deliveryLocation,
                      width: 40,
                      height: 40,
                      child: const Icon(
                        Icons.delivery_dining,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

Container(
  padding: const EdgeInsets.all(15),
  decoration: const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(20),
    ),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      /// 🔥 CURRENT STATUS
      Text(
        steps[currentStep],
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),

      const SizedBox(height: 5),

      /// ⏱ TIME
      Text(
        "Estimated Time: ${times[currentStep]} min",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 20),

      /// 🚀 STEP INDICATOR
      Column(
        children: List.generate(steps.length, (index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// CIRCLE
              Column(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: index <= currentStep
                          ? Colors.orange
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),

                  /// LINE
                  if (index != steps.length - 1)
                    Container(
                      width: 2,
                      height: 40,
                      color: index < currentStep
                          ? Colors.orange
                          : Colors.grey,
                    ),
                ],
              ),

              const SizedBox(width: 10),

              /// TEXT
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Text(
                    steps[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: index <= currentStep
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    ],
  ),
)
        ],
      ),
    );
  }
}