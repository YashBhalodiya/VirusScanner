import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen>
    with TickerProviderStateMixin {
  late AnimationController loadingController;

  // State variables for file
  File? _selectedFile;
  PlatformFile? _platformFile;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    // Dispose the animation controller
    loadingController.dispose();
    super.dispose();
  }

  /// Method to handle file selection
  Future<void> selectFile() async {
    try {
      final file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['apk', 'png', 'jpeg'], // Allowed file types
      );

      if (file != null) {
        setState(() {
          _selectedFile = File(file.files.single.path!);
          _platformFile = file.files.first;

          // Restart the animation for progress
          loadingController.reset();
          loadingController.forward();
        });
      }
    } catch (e) {
      // Handle file picker errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking file: $e')),
      );
    }
  }

  /// Widget to display file details
  Widget _buildFileDetails() {
    if (_platformFile == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selected File',
            style: TextStyle(color: Colors.grey.shade400, fontSize: 15),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(0, 1),
                  blurRadius: 3,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Row(
              children: [
                // Display file preview if it's an image
                if (_selectedFile != null && _platformFile!.extension != 'apk')
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _selectedFile!,
                      width: 70,
                    ),
                  )
                else
                  const Icon(Icons.insert_drive_file,
                      size: 70, color: Colors.blue),

                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _platformFile!.name,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.black),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${(_platformFile!.size / 1024).ceil()} KB',
                        style: TextStyle(
                            fontSize: 13, color: Colors.grey.shade500),
                      ),
                      const SizedBox(height: 5),
                      LinearProgressIndicator(
                        value: loadingController.value,
                        minHeight: 5,
                        color: Colors.blue,
                        backgroundColor: Colors.blue.shade50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Widget to display upload button or dotted border
  Widget _buildUploadButton() {
    if (_platformFile == null) {
      return GestureDetector(
        onTap: selectFile,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(10),
            dashPattern: const [10, 4],
            strokeCap: StrokeCap.round,
            color: Colors.blue.shade400,
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue.shade50.withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Iconsax.folder_open, color: Colors.blue, size: 40),
                  const SizedBox(height: 15),
                  Text(
                    'Select your file',
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: selectFile,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.refresh, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Upload Again',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Lottie.asset(
              'assets/file_upload_animation.json',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Upload your file',
              style: TextStyle(
                fontSize: 25,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'File should be in .apk, .png, or .jpeg format',
              style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
            ),
            const SizedBox(height: 20),
            _buildUploadButton(),
            _buildFileDetails(),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
