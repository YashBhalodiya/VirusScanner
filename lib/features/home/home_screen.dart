// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:virus_scanner/features/home/file_upload_screen.dart';
import 'package:virus_scanner/features/home/scan_device.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            'assets/safe-vitals-logo.svg',
            height: 40,
            width: 40,
          ),
          centerTitle: true,
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.5),
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(
            color: Colors.black,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: const TabBar(
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Upload File"),
              Tab(text: "Scan Device"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FileUploadScreen(), // File Upload Screen
            ScanDevice(), // Scan Device Screen
          ],
        ),
      ),
    );
  }
}
