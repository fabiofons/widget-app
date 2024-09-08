

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';


final isDarkModeProvider = StateProvider<bool>((ref) => true);
//listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

//State Notifier AppTheme (controlado por clases)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//Notifier or COntroller 
class ThemeNotifier extends StateNotifier<AppTheme> {

  // ThemeNotifier(super.state);
  ThemeNotifier(): super(AppTheme()); // Estado, State, instancia de AppTheme

  void toggleMode () {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
  void changeColorIndex (int index) {
    state = state.copyWith(selectedColor: index);
  }
 
}