// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:virus_scanner/features/home/file_upload_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/safe-vitals-logo.svg',
            height: 40, width: 40),
        centerTitle: true,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.5),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        // Left Button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print("Upload File clicked");
                              _pageController.animateToPage(
                                0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOutCubic,
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  color: Colors.white,
                                  child: Text(
                                    "Upload File",
                                    style: TextStyle(
                                      color: _currentPage == 0
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  color: _currentPage == 0
                                      ? Colors.blue
                                      : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Right Button
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print("Scan Device clicked");
                              _pageController.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOutCubic,
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  color: Colors.white,
                                  child: Text(
                                    "Scan Device",
                                    style: TextStyle(
                                      color: _currentPage == 1
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 2,
                                  color: _currentPage == 1
                                      ? Colors.blue
                                      : Colors.transparent,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              // Swipeable pages
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    print("Page changed to: $index");
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    // First Page
                    const FileUploadScreen(), // File Upload Screen

                    // Second Page
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (BuildContext context) {
                                return Container(
                                  width: double.infinity,
                                  height: 353,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 19),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 10,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      buildRow("04", "Virus"),
                                      buildRow("03", "Threats"),
                                      buildRow("140", "Malware"),
                                      buildRow("155", "Virus"),
                                      buildRow("45", "Virus"),
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Scanning Your Device...",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

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
        ],
      ),
    );
  }
}

// Functions for duplicate codes
Widget buildRow(String count, String label) {
  return Column(
    children: [
      Row(
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
          const Spacer(),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
        ],
      ),
      const SizedBox(height: 13),
    ],
  );
}
