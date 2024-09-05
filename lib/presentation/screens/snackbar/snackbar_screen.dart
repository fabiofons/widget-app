import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final  snackbar =  SnackBar(
      content: const Text('Hola mundo'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'Close', 
        onPressed: (){
          ScaffoldMessenger.of(context).clearSnackBars();
        }),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Elit velit sunt aliqua proident ut quis enim enim. Consectetur ut consequat minim magna ad nisi fugiat Lorem incididunt adipisicing mollit id.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Cancel')
          ),
          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Accept')
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            FilledButton(
              child: const Text('Licencias usadas'),
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Incididunt proident excepteur cillum labore laborum in qui pariatur pariatur.')
                  ]
                  );
              },
            ),
            FilledButton(
              child: const Text('Mostrar Diálogo'),
              onPressed: () => openDialog(context),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}