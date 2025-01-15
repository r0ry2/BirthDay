import 'package:flutter/material.dart';






import 'package:audioplayers/audioplayers.dart'; // إضافة حزمة الصوت

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  // إضافة مشغل الصوت
  final AudioPlayer _audioPlayer = AudioPlayer();

  // قائمة المهام
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
      'image': 'assets/music.png',
    },
    {
      'task': 'Arrange Food and Drinks',
      'description': "Order catering or prepare a home-cooked meal.",
      'isChecked': false,
      'image': 'assets/food.png',
    },
    {
      'task': 'Decorate the Venue',
      'description': "Balloons, banners, and a cheerful theme.",
      'isChecked': false,
      'image': 'assets/decor.png',
    },
    {
      'task': 'Confirm Guest List',
      'description': "Ensure everyone is invited and informed.",
      'isChecked': false,
      'image': 'assets/guests.png',
    },
    // إضافة عنصر جديد يحتوي على الصورة، النص، وزر التشغيل
    {
      'task': 'Play Music',
      'description': 'Click the button to play your favorite music.',
      'isChecked': false,
      'image': 'assets/music_icon.png', // إضافة صورة جديدة
    },
  ];

  // إضافة مهمة جديدة
  void _addTask() {
    setState(() {
      tasks.add({
        'task': 'New Task',
        'description': 'Description of the new task.',
        'isChecked': false,
        'image': 'assets/plus.png', // صورة افتراضية
      });
    });
  }

  // تشغيل الصوت عند الضغط على الزر
  void _playMusic() async {
    await _audioPlayer.play('https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'); // رابط صوتي تجريبي
  }

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
        backgroundColor: const Color.fromARGB(115, 200, 29, 117),
      ),
      backgroundColor: const Color.fromARGB(255, 246, 123, 141), // خلفية وردية
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Image.asset(
                tasks[index]['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(tasks[index]['task']),
              subtitle: Text(tasks[index]['description']),
              trailing: tasks[index]['task'] == 'Play Music'
    ? IconButton(
        icon: Image.asset(
          'assets/music_icon.png', // مسار الصورة التي تريد استخدامها
          width: 30,
          height: 30,
        ),
        onPressed: _playMusic, // وظيفة تشغيل الصوت عند الضغط
      )
    : Checkbox(
        value: tasks[index]['isChecked'],
        onChanged: (bool? value) {
          setState(() {
            tasks[index]['isChecked'] = value!;
          });
        },
      ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        backgroundColor: const Color.fromARGB(115, 200, 29, 117),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
