import 'package:flutter/material.dart';
import 'package:moika/domains/main/components/bottom_elements.dart';
import 'package:moika/domains/main/components/top_elements.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: const [
            Image(
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/map-pattern.png")),
            Align(alignment: Alignment.topCenter, child: TopElements()),
            Align(alignment: Alignment.bottomCenter, child: BottomElements())
          ],
        ),
      ),
    );
  }
}
