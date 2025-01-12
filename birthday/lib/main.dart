import 'package:flutter/material.dart';

void main() {
  runApp(BirthdayApp());
}

class BirthdayApp extends StatelessWidget {
  const BirthdayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "🎉 Birthday card 🎂",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 253, 138, 211),
      ),
      backgroundColor: const Color.fromARGB(255, 215, 131, 184),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/balloons_image.png',
              width: 300,
            ),
            SizedBox(height: 5),
            Text(
              "🎉 To my friend Hana 🎂",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "I wish you a beautiful new life",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThirdPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: Text(
                "Go to Party Plans",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

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
      backgroundColor: const Color.fromARGB(255, 255, 182, 193), // خلفية وردية
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Dear Hana,\n\nWishing you a very Happy Birthday! "
                "May your day be filled with love, laughter, and countless beautiful moments. "
                "You deserve all the happiness in the world on this special day and always. "
                "Thank you for being an amazing friend. 🎉🎂🎁",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // العودة إلى الصفحة الأولى
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: Text(
                "Back to Main Page",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Party Plans",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 182, 193), // خلفية وردية
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.cake, color: Colors.pink),
            title: Text("Order the Birthday Cake"),
            subtitle: Text("Make sure to choose Hana's favorite flavor."),
          ),
          ListTile(
            leading: Icon(Icons.music_note, color: Colors.blue),
            title: Text("Prepare the Music Playlist"),
            subtitle: Text("Include fun and favorite tracks."),
          ),
          ListTile(
            leading: Icon(Icons.food_bank, color: Colors.green),
            title: Text("Arrange Food and Drinks"),
            subtitle: Text("Order catering or prepare a home-cooked meal."),
          ),
          ListTile(
            leading: Icon(Icons.ballot, color: Colors.orange),
            title: Text("Decorate the Venue"),
            subtitle: Text("Balloons, banners, and a cheerful theme."),
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.purple),
            title: Text("Confirm Guest List"),
            subtitle: Text("Ensure everyone is invited and informed."),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.local_dining, color: Colors.red),
            title: Text("Plan the Food Menu"),
            subtitle: Text("Include appetizers, main course, and desserts."),
          ),
          ListTile(
            leading: Icon(Icons.card_giftcard, color: Colors.teal),
            title: Text("Prepare Gifts"),
            subtitle: Text("Wrap and organize the gifts for guests."),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today, color: Colors.blueGrey),
            title: Text("Set the Party Date"),
            subtitle: Text("Finalize and communicate the date to everyone."),
          ),
        ],
      ),
    );
  }
}
