import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileState with ChangeNotifier {
  File? _file;
  PlatformFile? _platformFile;

  File? get file => _file;
  PlatformFile? get platformFile => _platformFile;

  void setFile(File file, PlatformFile platformFile) {
    _file = file;
    _platformFile = platformFile;
    notifyListeners();
  }

  void clearFile() {
    _file = null;
    _platformFile = null;
    notifyListeners();
  }
}
