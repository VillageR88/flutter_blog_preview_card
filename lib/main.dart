import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:universal_html/html.dart' as html;

void main() {
  runApp(const MyApp());
  html.document.getElementById('loadingPicture')?.style.display = 'none';
  html.document.getElementById('spinner')?.classes.remove('loading');
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
      home: const MyHomePage(title: 'Blog preview card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool isButtonHovered = false;

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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double containerWidth;
                  Map<String, int> h1;
                  Map<String, int> span;
                  Map<String, int> p;
                  if (constraints.maxWidth > 768) {
                    containerWidth = 384;
                    h1 = {
                      'fontSize': 24,
                    };
                    span = {
                      'fontSize': 14,
                    };
                    p = {
                      'fontSize': 16,
                    };
                  } else {
                    containerWidth = 337;
                    h1 = {
                      'fontSize': 20,
                    };
                    span = {
                      'fontSize': 12,
                    };
                    p = {
                      'fontSize': 14,
                    };
                  }
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    width: containerWidth,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 0,
                          offset: isButtonHovered
                              ? const Offset(16, 16)
                              : const Offset(8, 8),
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
                            child: Semantics(
                              label: 'Illustration of an article',
                              child: SvgPicture.asset(
                                'assets/images/illustration-article.svg',
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
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
                                child: Text(
                                  'Learning',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: span['fontSize']!.toDouble(),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Published 21 Dec 2023',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: span['fontSize']!.toDouble(),
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 12),
                              MouseRegion(
                                onEnter: (_) =>
                                    setState(() => isButtonHovered = true),
                                onExit: (_) =>
                                    setState(() => isButtonHovered = false),
                                child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                      const Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    padding: WidgetStateProperty.all(
                                      const EdgeInsets.symmetric(
                                        horizontal: 0,
                                        vertical: 0,
                                      ),
                                    ),
                                    overlayColor: WidgetStateProperty.all(
                                        Colors.transparent),
                                    foregroundColor:
                                        WidgetStateProperty.resolveWith(
                                            (states) {
                                      if (states
                                          .contains(WidgetState.hovered)) {
                                        return const Color(0xFFF4D04E);
                                      }
                                      return Colors.black87;
                                    }),
                                    animationDuration: const Duration(
                                        milliseconds:
                                            150), // Adjust the duration here
                                  ),
                                  child: Text(
                                    'HTML & CSS foundations',
                                    style: TextStyle(
                                      fontSize: h1['fontSize']!.toDouble(),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'These languages are the backbone of every website, defining structure, content, and presentation.',
                                style: TextStyle(
                                    fontSize: p['fontSize']!.toDouble(),
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF7F7F7F)),
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
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
