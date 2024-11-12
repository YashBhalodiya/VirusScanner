import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'dart:io';

class VirusScanner extends StatefulWidget {
  const VirusScanner({super.key});

  @override
  _VirusScannerState createState() => _VirusScannerState();
}

class _VirusScannerState extends State<VirusScanner> {
  String _result = "No file scanned yet";
  final String _apiKey =
      'YOUR_API_KEY_HERE'; // Replace with your VirusTotal API Key

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String? path = result.files.single.path;
      if (path != null) {
        // Call the scanning function here
        _scanFile(path);
      }
    }
  }

  Future<void> _scanFile(String path) async {
    setState(() {
      _result = "Scanning $path...";
    });

    // Read the file
    File file = File(path);
    var fileBytes = await file.readAsBytes();

    // Create a multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://www.virustotal.com/vtapi/v2/file/scan'),
    );

    // Add the file to the request
    request.files.add(
      http.MultipartFile.fromBytes('file', fileBytes,
          filename: file.uri.pathSegments.last),
    );
    request.fields['apikey'] = _apiKey;

    // Send the request
    var response = await request.send();

    // Check the response
    if (response.statusCode == 200) {
      // Get the response data
      var responseData = await http.Response.fromStream(response);
      var jsonResponse = json.decode(responseData.body);

      // Check the response and update result
      if (jsonResponse['response_code'] == 1) {
        setState(() {
          _result =
              "File scanned successfully! Scan ID: ${jsonResponse['scan_id']}";
        });
      } else {
        setState(() {
          _result = "Error scanning file: ${jsonResponse['verbose_msg']}";
        });
      }
    } else {
      setState(() {
        _result = "Error scanning file.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virus Scanner'),
        backgroundColor: Colors.greenAccent,
        toolbarHeight: 60,
        elevation: 5,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.shield,
              size: 100,
              color: Colors.greenAccent,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickFile,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.greenAccent,
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Select File to Scan'),
            ),
            const SizedBox(height: 30),
            Text(
              _result,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: _result.contains("successfully")
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
