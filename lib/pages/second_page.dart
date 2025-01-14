import 'package:flutter/material.dart';


class SecondPage extends StatelessWidget {
  final String name;

  const SecondPage({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "hello Birthday Message",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 193),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Happy Birthday, $name!\n\n"
            "May your day be filled with love, laughter, and countless beautiful moments. "
                "You deserve all the happiness in the world on this special day and always. "
                "Thank you for being an amazing friend. 🎉🎂🎁",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
