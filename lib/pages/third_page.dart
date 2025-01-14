import 'package:flutter/material.dart';



class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  // قائمة من المهام
  List<Map<String, dynamic>> tasks = [
    {
      'task': 'Order the Birthday Cake',
      'description': "Make sure to choose Hana's favorite flavor.",
      'isChecked': false,
      'image': 'assets/birthdaycake.png',
    },
    {
      'task': 'Prepare the Music Playlist',
      'description': "Include fun and favorite tracks.",
      'isChecked': false,
      'image': 'assets/music.jpg',
    },
    {
      'task': 'Arrange Food and Drinks',
      'description': "Order catering or prepare a home-cooked meal.",
      'isChecked': false,
      'image': 'assets/food.jpg',
    },
    {
      'task': 'Decorate the Venue',
      'description': "Balloons, banners, and a cheerful theme.",
      'isChecked': false,
      'image': 'assets/decor.jpg',
    },
    {
      'task': 'Confirm Guest List',
      'description': "Ensure everyone is invited and informed.",
      'isChecked': false,
      'image': 'assets/guests.jpg',
    },
  ];

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
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(tasks[index]['image'], width: 50, height: 50, fit: BoxFit.cover),
            title: Text(tasks[index]['task']),
            subtitle: Text(tasks[index]['description']),
            trailing: Checkbox(
              value: tasks[index]['isChecked'],
              onChanged: (bool? value) {
                setState(() {
                  tasks[index]['isChecked'] = value!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
