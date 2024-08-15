import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Figtree', // Set the default font family
      ),
      title: 'Blog preview card',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            padding: const EdgeInsets.all(40),
            color: const Color(0xFFF4D04E),
            child: Center(
              child: Container(
                width: 384,
                constraints: const BoxConstraints(
                  minHeight: 522,
                ),
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
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: SvgPicture.asset(
                          'assets/images/illustration-article.svg',
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4D04E),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Learning',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Published 21 Dec 2023',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'HTML & CSS foundations',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'These languages are the backbone of every website, defining structure, content, and presentation.',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(127, 127, 127, 1)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/image-avatar.webp',
                          height: 32.0,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Greg Hooper',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
