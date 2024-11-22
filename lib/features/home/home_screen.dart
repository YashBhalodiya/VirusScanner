// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:virus_scaner/features/home/upload_file_screen.dart';

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
        title: const Text(
          "Virus Scanner",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2, // Controls the shadow intensity
        shadowColor: Colors.black.withOpacity(0.5), // Optional: Shadow color
        backgroundColor: Colors.white, // Optional: Change AppBar background
        titleTextStyle: const TextStyle(
          color: Colors.black, // Optional: Change title text color
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          print("Scan Device clicked");
                          _pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOutCubic);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _currentPage == 0
                              ? Colors
                                  .blue // Highlighted color for active button
                              : Colors.grey[
                                  300], // Default color for inactive button
                          foregroundColor: _currentPage == 0
                              ? Colors.white // Text color for active button
                              : Colors.black, // Text color for inactive button
                        ),
                        child: const Text("Scan Device")),
                    ElevatedButton(
                        onPressed: () {
                          print("Upload file clicked");
                          _pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOutCubic);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _currentPage == 1
                              ? Colors.blue
                              : Colors.grey[300],
                          foregroundColor:
                              _currentPage == 1 ? Colors.white : Colors.black,
                        ),
                        child: const Text("Upload File")),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Radar Animation Tapped");
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
                    // Second Page
                    const UploadFileScreen(),
                  ],
                ),
              ),
            ],
          ),

          // Bottom Fixed Buttons

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => print("Security Advisor Tapped"),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.security,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Security Advisor",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => print("Threat Analyzer Tapped"),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.warning_amber_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Threat Analyzer",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => print("Hidden Apps Tapped"),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.apps,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Hidden Apps",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => print("App Statistics Tapped"),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.bar_chart,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "App Statistics",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      print("Scan Again Button Pressed");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 33, 100, 177),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 90, vertical: 15),
                    ),
                    child: const Text(
                      "Scan Again",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
