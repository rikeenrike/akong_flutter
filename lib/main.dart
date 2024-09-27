import 'package:flutter/material.dart';
import 'about.dart';

void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _navigateToAboutPage() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          const Color.fromARGB(255, 255, 255, 255), // Set background color here
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Make AppBar transparent
          elevation: 0, // Remove AppBar shadow
        ),
        backgroundColor:
            Colors.transparent, // Make Scaffold background transparent
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 250),
                  Image.asset(
                    'assets/GDGC.png',
                    width: 1000,
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Google Developer Groups',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'GoogleSans',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 5),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'GoogleSans',
                      ),
                      children: [
                        TextSpan(
                          text: 'On Campus',
                          style: TextStyle(
                            color: Color.fromARGB(255, 15, 108, 230),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' · University of the Immaculate Conception',
                          style: TextStyle(
                            color: Color.fromARGB(
                                255, 6, 6, 6), // Color for the rest of the text
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                   heroTag: null,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutPage()),
                      );
                    }, // Navigate to AboutPage
                    tooltip: 'info',
                    child: const Icon(Icons.info),
                  ),
                  const SizedBox(width: 20),
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    onPressed: () {
                      setState(() {
                        _counter = 0; // Reset counter
                      });
                    },
                    tooltip: 'event',
                    child: const Icon(Icons.event),
                  ),
                  const SizedBox(width: 20),
                  FloatingActionButton(
                    heroTag: null,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    onPressed: _decrementCounter,
                    tooltip: 'contact',
                    child: const Icon(Icons.alternate_email),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
