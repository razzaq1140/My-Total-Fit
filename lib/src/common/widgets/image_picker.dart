import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _pickImage();
  }

  Future<void> _pickImage() async {
    final XFile? imageFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      Navigator.of(context)
          .pop(imageFile.path); // Return the image path if selected
    } else {
      Navigator.of(context).pop(); // Close if no image is selected
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()), // Loading indicator
    );
  }
}
