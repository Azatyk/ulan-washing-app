import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moika/domains/main/views/map_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MapView()));
}
