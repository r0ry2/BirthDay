import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'second_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();


  @override
  Widget build(BuildContext context) {
    _loadSavedName();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "🎉 Birthday card 🎂",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 240, 239, 241),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 201, 90, 171),
      ),
      backgroundColor: const Color.fromARGB(255, 201, 90, 171),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/balloons_image.png',
              width: 300,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.pink,
                      width: 2,
                    ),
                  ),
                  labelText: "Enter your name",
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurple,
                  ),
                ),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                _saveName(name);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage(name: name)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: Text(
                "Go to Birthday Message",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', name);
  }

  Future<void> _loadSavedName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedName = prefs.getString('username');
    if (savedName != null) {
      nameController.text = savedName;
    }
  }
  
}
