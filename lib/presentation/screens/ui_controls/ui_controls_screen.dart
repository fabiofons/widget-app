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
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

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
                })),
        ExpansionTile(
          title: const Text('Transportation Vehicle'),
          subtitle: Text('$seletedTransportation'),
          children: [
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
        ),
        CheckboxListTile(
          title: const Text('Breakfast'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Lunch'),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('Dinner'),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
