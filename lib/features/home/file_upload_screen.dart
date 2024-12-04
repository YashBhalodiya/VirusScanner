import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  double _progress = 0.0;
  bool _isUploading = false;
  bool _uploadCompleted = false;
  String? _fileName;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        startUpload();
      });
    }
  }

  void startUpload() {
    setState(() {
      _isUploading = true;
      _uploadCompleted = false;
      _progress = 0.0;
    });

    // Simulate upload
    Future.delayed(const Duration(milliseconds: 300), () {
      Timer.periodic(const Duration(milliseconds: 300), (timer) {
        setState(() {
          _progress += 0.1;
          if (_progress >= 1.0) {
            _isUploading = false;
            _uploadCompleted = true;
            timer.cancel();
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Upload File',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: pickFile,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: _uploadCompleted
                              ? Colors.green
                              : Colors.teal.withOpacity(0.8),
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: _isUploading
                              ? CircularProgressIndicator(
                                  value: _progress,
                                  color: Colors.white,
                                  strokeWidth: 6.0,
                                )
                              : const Icon(
                                  Icons.cloud_upload,
                                  size: 50,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      _fileName != null
                          ? 'Selected File: $_fileName'
                          : 'No file selected',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _uploadCompleted ? pickFile : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.teal,
                    ),
                    child: const Text(
                      "Scan Again",
                      style: TextStyle(fontSize: 16),
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
