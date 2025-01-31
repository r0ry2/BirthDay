import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'third_page.dart'; // تأكد من استخدام مسار الملف الصحيح لصفحتك الثالثة

class SecondPage extends StatelessWidget {
  final String name;

  const SecondPage({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // أيقونة السهم
          color: const Color.fromARGB(255, 18, 8, 8),          // لون الأيقونة
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Party Plans",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(115, 200, 29, 117),
        automaticallyImplyLeading: false, // إلغاء السهم الافتراضي لضمان ظهور المخصص
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
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(103, 58, 183, 1),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20), // مساحة بين النص والزر
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
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text(
                  "Go to Third Page",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 243, 242, 245),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // إضافة الدالة checkUser() هنا
  void checkUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('username');
    
    if (name != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SecondPage(name: name)),
      );
    }
  }
}
