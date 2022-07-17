import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_sample_app/helper/utils/logger.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickUpImageFromAlbum(BuildContext context) async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile == null) {
    logger.i('Pick image cancelled.');
    return null;
  }
  final file = File(pickedFile.path);
  return file;
}

Future<File?> pickUpImageFromCamera(BuildContext context) async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
  if (pickedFile == null) {
    logger.i('Pick image cancelled.');
    return null;
  }
  final file = File(pickedFile.path);
  return file;
}
