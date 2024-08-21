import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reciepy_app/spleshPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SpleshClass(),
  ));
}
