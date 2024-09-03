import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.pop();
        }, 
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {

  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colorTheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated Btn')),
            const ElevatedButton(onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(
              onPressed: (){}, 
              label: const Text('Icon Elevated'), 
              icon: const Icon(Icons.theater_comedy_outlined)
            ),
            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(
              icon: const Icon(Icons.safety_check_outlined),
              onPressed: (){}, 
              label: const Text('Filled Icon')
            ),
            OutlinedButton(onPressed: (){}, child: const Text('Outlined')),
            OutlinedButton.icon(
              onPressed: (){}, 
              label: const Text('Outlined Icon'),
              icon: const Icon(Icons.face_unlock_outlined),
            ),
            TextButton(onPressed: (){}, child: const Text('Text Btn')),
            TextButton.icon(onPressed: (){}, 
              label: const Text('Text icon'), 
              icon: const Icon(Icons.text_decrease_outlined),
            ),

            const CustomButton(),

            IconButton(onPressed: (){}, icon: const Icon(Icons.app_blocking_outlined)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.app_blocking_outlined),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colorTheme.primary),
                iconColor: const WidgetStatePropertyAll(Colors.amber)
              ),
            )
          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colotTheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colotTheme.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Custom Btn', 
              style: TextStyle(
                color: Colors.amber
              ),)),
        ),
      ),
    );
  }
}