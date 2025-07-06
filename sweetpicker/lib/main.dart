import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello,world!'))),
    );
  }
}

@override
Widget build(BuildContext context) {
  return const MaterialApp(
    home: Scaffold(body: Center(child: ButtonRow())),
  );
}

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: () {}, child: const Text('Login')),
        const SizedBox(width: 16),
        ElevatedButton(onPressed: () {}, child: const Text('Signup')),
      ],
    );
  }
}
