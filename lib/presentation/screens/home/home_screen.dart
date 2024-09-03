import 'package:flutter/material.dart';
import 'package:widget_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'),
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return  _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) {

    final colorTheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colorTheme.primary,),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colorTheme.primary,),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      onTap: () {
        //TODO: navigate to other pages
      },    
    );
  }
}