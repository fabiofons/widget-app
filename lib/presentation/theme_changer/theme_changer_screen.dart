import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = 'theme_changer';

  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final isDarkMode = ref.watch(isDarkModeProvider);
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode; // using state notifier

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Options'),
        actions: [
          IconButton(
            icon: Icon( isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: (){
              // ref.read(isDarkModeProvider.notifier).update(
              //   (state) => !state
              // );
              ref.read(themeNotifierProvider.notifier).toggleMode(); // using state notifier
            },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final List<Color> colorList = ref.watch(colorListProvider);
    // final seletedColor = ref.watch(selectedColorProvider);
    final seletedColor = ref.watch(themeNotifierProvider).selectedColor; // using state notifier

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (context, index) {
        final Color color = colorList[index];
        return RadioListTile(
          title: Text('This color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: seletedColor, 
          onChanged: (value) {
            // ref.read(selectedColorProvider.notifier).state = index;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index); // using state notifier
          },
        );
      },
    );
  }
}
