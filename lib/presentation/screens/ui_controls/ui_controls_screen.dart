import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {

  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: const _UiControlsScreen(),
    );
  }
}

class _UiControlsScreen extends StatefulWidget {
  const _UiControlsScreen();

  @override
  State<_UiControlsScreen> createState() => _UiControlsScreenState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsScreenState extends State<_UiControlsScreen> {

  bool isDeveloper = true;
  Transportation seletedTransportation = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Aditional information'),
          value: isDeveloper, 
          onChanged: (value) => setState(() {
              isDeveloper = value;
            }
          )
        ),
        RadioListTile(          
          title: const Text('By Car'),
          subtitle: const Text('Travel using a car'),
          value: Transportation.car, 
          groupValue: seletedTransportation, 
          onChanged: (value) => setState(() {
            seletedTransportation = Transportation.car;
          }),
        ),
        RadioListTile(
          title: const Text('By Boat'),
          subtitle: const Text('Travel using a boat'),
          value: Transportation.boat, 
          groupValue: seletedTransportation, 
          onChanged: (value) => setState(() {
            seletedTransportation = Transportation.boat;
          }),
        ),
        RadioListTile(
          title: const Text('By Plane'),
          subtitle: const Text('Travel using a plane'),
          value: Transportation.plane, 
          groupValue: seletedTransportation, 
          onChanged: (value) => setState(() {
            seletedTransportation = Transportation.plane;
          }),
        ),
        RadioListTile(          
          title: const Text('By Submarine'),
          subtitle: const Text('Travel using a submarine'),
          value: Transportation.submarine,
          groupValue: seletedTransportation, 
          onChanged: (value) => setState(() {
            seletedTransportation = Transportation.submarine;
          }),
        ),
      ],
    );
  }
}