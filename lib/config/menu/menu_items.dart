import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItems( {
    required this.title,
    required this.subtitle, 
    required this.link, 
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Counter', 
    subtitle: 'Custom counter', 
    link: '/counter', 
    icon: Icons.countertops_rounded
  ),
  MenuItems(
    title: 'Botones', 
    subtitle: 'Varios botones en Flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
  ),
  MenuItems(
    title: 'Tarjetas', 
    subtitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card
  ),
  MenuItems(
    title: 'Progress Indicators', 
    subtitle: 'Barras de progreso', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),
  MenuItems(
    title: 'Snackbars y diálogos', 
    subtitle: 'Indicadores en pantalla', 
    link: '/snackbars', 
    icon: Icons.info_outline_rounded
  ),
  MenuItems(
    title: 'Animated Container', 
    subtitle: 'Statefull Widget animated', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank
  ),
  MenuItems(
    title: 'UI Controls + Tiles', 
    subtitle: 'A group of Flutter forms controls', 
    link: '/ui-controls', 
    icon: Icons.design_services_outlined
  ),
  MenuItems(
    title: 'Intro to App', 
    subtitle: 'Introducing tutorial', 
    link: '/tutorial', 
    icon: Icons.leak_add_sharp
  ),
  MenuItems(
    title: 'Infinite Scroll & Pull', 
    subtitle: 'Scrolling more and more and pull refresh', 
    link: '/infinite-scroll', 
    icon: Icons.swap_vert_circle_outlined
  ),
  MenuItems(
    title: 'Themes', 
    subtitle: 'You can change your theme here', 
    link: '/theme-changer', 
    icon: Icons.theater_comedy_outlined
  ),
];