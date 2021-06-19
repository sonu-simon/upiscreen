import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:findmind_upiscreen/upiScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await http.get(Uri.parse('https://fakeface.rest/face/json')).then((response) {
    var jsonDecoded = jsonDecode(response.body);
    print(jsonDecoded['image_url']);
    imageURL = jsonDecoded['image_url'];
  });
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UpiScreen(),
    );
  }
}
