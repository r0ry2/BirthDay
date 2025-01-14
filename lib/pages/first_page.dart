import 'package:flutter/material.dart';
import 'second_page.dart';
import 'third_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({super.key});

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: const Color.fromARGB(2255, 201, 90, 171),
      ),
      backgroundColor: const Color.fromARGB(255, 201, 90, 171),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                "Navigation Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.event_note, color: Colors.deepPurple),
              title: Text("Birthday Message"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage(name: '',)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.party_mode, color: Colors.pink),
              title: Text("Party Plans"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.pages, color: Colors.blue),
              title: Text("Fourth Page"),
              
            ),
          ],
        ),
      ),
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
}
