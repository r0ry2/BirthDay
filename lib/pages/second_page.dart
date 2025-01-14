import 'package:flutter/material.dart';



import 'third_page.dart'; // تأكد من استخدام مسار الملف الصحيح لصفحتك الثالثة

class SecondPage extends StatelessWidget {
  final String name;

  const SecondPage({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Birthday Message",
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Happy Birthday, $name!\n\n"
                "May your day be filled with love, laughter, and countless beautiful moments. "
                "You deserve all the happiness in the world on this special day and always. "
                "Thank you for being an amazing friend. 🎉🎂🎁",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(103, 58, 183, 1),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // مساحة بين النص والزر
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThirdPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(103, 58, 183, 1), // لون الزر
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text("Go to Third Page",
                style: TextStyle(
                   fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 243, 242, 245),

                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
