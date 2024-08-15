import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Blog preview card',
      home: MyHomePage(title: 'Blog preview card'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(title),
      // ),
      body: Container(
        color: const Color(0xFFF4D04E),
        child: Center(
          child: Container(
            width: 384,
            height: 522,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 0,
                  offset: Offset(8, 8),
                ),
              ],
              border: Border.all(
                color: const Color.fromARGB(255, 0, 0, 0),
                width: 1,
              ),
            ),
            child: const Center(
              child: Text(
                'Central Element',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
