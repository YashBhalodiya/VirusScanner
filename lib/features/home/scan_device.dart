import 'package:flutter/material.dart';

class ScanDevice extends StatelessWidget {
  const ScanDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 19),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Scan Results",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          buildRow("04", "Virus"),
                          buildRow("03", "Threats"),
                          buildRow("140", "Malware"),
                          buildRow("155", "Adware"),
                          buildRow("45", "Spyware"),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [Colors.greenAccent, Colors.green],
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Radar Animation",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Scanning Your Device...",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build rows for the bottom sheet
  Widget buildRow(String count, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                count,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}





// Bottom Fixed Buttons

    // Positioned(
    //   bottom: 0,
    //   left: 0,
    //   right: 0,
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(vertical: 12),
    //     decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(12),
    //         boxShadow: [
    //           BoxShadow(
    //               color: Colors.black12.withOpacity(0.111),
    //               offset: const Offset(0, -1),
    //               blurRadius: 7,
    //               spreadRadius: 0.5)
    //         ]),
    //     child: Column(
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Expanded(
    //               child: GestureDetector(
    //                 onTap: () => print("Security Advisor Tapped"),
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       padding: const EdgeInsets.all(15),
    //                       decoration: const BoxDecoration(
    //                         color: Colors.orange,
    //                         shape: BoxShape.circle,
    //                       ),
    //                       child: const Icon(
    //                         Icons.security,
    //                         color: Colors.white,
    //                         size: 30,
    //                       ),
    //                     ),
    //                     const SizedBox(height: 5),
    //                     const Text(
    //                       "Security Advisor",
    //                       style: TextStyle(
    //                           fontSize: 13, fontWeight: FontWeight.bold),
    //                       textAlign: TextAlign.center,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Expanded(
    //               child: GestureDetector(
    //                 onTap: () => print("Threat Analyzer Tapped"),
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       padding: const EdgeInsets.all(15),
    //                       decoration: const BoxDecoration(
    //                         color: Colors.orange,
    //                         shape: BoxShape.circle,
    //                       ),
    //                       child: const Icon(
    //                         Icons.warning_amber_rounded,
    //                         color: Colors.white,
    //                         size: 30,
    //                       ),
    //                     ),
    //                     const SizedBox(height: 5),
    //                     const Text(
    //                       "Threat Analyzer",
    //                       style: TextStyle(
    //                           fontSize: 13, fontWeight: FontWeight.bold),
    //                       textAlign: TextAlign.center,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(height: 10),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Expanded(
    //               child: GestureDetector(
    //                 onTap: () => print("Hidden Apps Tapped"),
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       padding: const EdgeInsets.all(15),
    //                       decoration: const BoxDecoration(
    //                         color: Colors.orange,
    //                         shape: BoxShape.circle,
    //                       ),
    //                       child: const Icon(
    //                         Icons.apps,
    //                         color: Colors.white,
    //                         size: 30,
    //                       ),
    //                     ),
    //                     const SizedBox(height: 5),
    //                     const Text(
    //                       "Hidden Apps",
    //                       style: TextStyle(
    //                           fontSize: 13, fontWeight: FontWeight.bold),
    //                       textAlign: TextAlign.center,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             Expanded(
    //               child: GestureDetector(
    //                 onTap: () => print("App Statistics Tapped"),
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       padding: const EdgeInsets.all(15),
    //                       decoration: const BoxDecoration(
    //                         color: Colors.orange,
    //                         shape: BoxShape.circle,
    //                       ),
    //                       child: const Icon(
    //                         Icons.bar_chart,
    //                         color: Colors.white,
    //                         size: 30,
    //                       ),
    //                     ),
    //                     const SizedBox(height: 5),
    //                     const Text(
    //                       "App Statistics",
    //                       style: TextStyle(
    //                           fontSize: 13, fontWeight: FontWeight.bold),
    //                       textAlign: TextAlign.center,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         const SizedBox(height: 30),
    //         ElevatedButton(
    //           onPressed: () {
    //             print("Scan Again Button Pressed");
    //           },
    //           style: ElevatedButton.styleFrom(
    //               backgroundColor:
    //                   const Color.fromARGB(255, 33, 100, 177),
    //               padding: const EdgeInsets.symmetric(
    //                   horizontal: 90, vertical: 15),
    //               shape: RoundedRectangleBorder(
    //                   borderRadius: BorderRadius.circular(10))),
    //           child: const Text(
    //             "Scan Again",
    //             style: TextStyle(fontSize: 18, color: Colors.white),
    //           ),
    //         ),
    //         const SizedBox(height: 30),
    //       ],
    //     ),
    //   ),
    // ),