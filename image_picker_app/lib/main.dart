import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MaterialApp(home: ImagePickerApp()));

class ImagePickerApp extends StatefulWidget {
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePickerApp> {
  File _imageFile;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Image Picker'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: <Widget>[
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.photo_camera),
                onPressed: () async => _pickImageFromCamera(),
                tooltip: 'Shoot picture',
              ),
              IconButton(
                icon: const Icon(Icons.photo),
                onPressed: () async => _pickImageFromGallery(),
                tooltip: 'Pick from gallery',
              ),
            ],
          ),
          if (this._imageFile == null)
            const Placeholder()
          else
            Image.file(this._imageFile),
        ],
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final PickedFile pickedFile =
        await _picker.getImage(source: ImageSource.gallery);
    setState(() => this._imageFile = File(pickedFile.path));
  }

  Future<void> _pickImageFromCamera() async {
    final PickedFile pickedFile =
        await _picker.getImage(source: ImageSource.camera);
    setState(() => this._imageFile = File(pickedFile.path));
  }
}
