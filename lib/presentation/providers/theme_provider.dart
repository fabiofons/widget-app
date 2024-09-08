

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/theme/app_theme.dart';


final isDarkModeProvider = StateProvider<bool>((ref) => true);
//listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);