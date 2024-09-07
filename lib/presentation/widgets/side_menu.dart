import 'package:flutter/material.dart';
// import 'package:widget_app/config/menu/menu_items.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) => setState(() {
        navDrawerIndex = value;
      }),
      children: const [
        NavigationDrawerDestination(
          icon: Icon(Icons.add_business_outlined), 
          label: Text('Option 1')
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.add_business_outlined), 
          label: Text('Option 2')
        ),
      ]
    );
  }
}