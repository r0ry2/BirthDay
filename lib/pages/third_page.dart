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
    // إضافة عناصر جديدة تحتوي على الصورة، النص، وزر التشغيل لكل أغنية
   // إضافة 12 أغنية مختلفة
...List.generate(12, (index) {
  return {
    'task': 'Play Song ${index + 1}', // عنوان الأغنية
    'description': 'Click the button to play your favorite song.', // وصف الأغنية
    'isChecked': false,
    'image': 'assets/music_icon.png', // صورة تمثل الأغنية
    // روابط الأغاني الفريدة
    'songUrl': [
          'https://drive.google.com/uc?export=download&id=1wKcCd5WEKa3gBo29v_YOpz-PLKtw7XAq',
          'https://drive.google.com/uc?export=download&id=1w_8y-3nUAWsPdJ3nm4-DKm5ac0SrldDx',
          'https://drive.google.com/uc?export=download&id=1eQom_4Jlbpa2Nrzwf6MdvKbARwFZfixZ',
          'https://drive.google.com/uc?export=download&id=1wKcCd5WEKa3gBo29v_YOpz-PLKtw7XAq',
          'https://drive.google.com/uc?export=download&id=1wKcCd5WEKa3gBo29v_YOpz-PLKtw7XAq',
          'https://drive.google.com/uc?export=download&id=1wKcCd5WEKa3gBo29v_YOpz-PLKtw7XAq',
          'https://drive.google.com/uc?export=download&id=1wKcCd5WEKa3gBo29v_YOpz-PLKtw7XAq',
          'https://drive.google.com/uc?export=download&id=1wKcCd5WEKa3gBo29v_YOpz-PLKtw7XAq',
          'https://drive.google.com/uc?export=download&id=1wKcCd5WEKa3gBo29v_YOpz-PLKtw7XAq',
          'https://drive.google.com/uc?export=download&id=1wKcCd5WEKa3gBo29v_YOpz-PLKtw7XAq',
          'https://drive.google.com/uc?export=download&id=1wKcCd5WEKa3gBo29v_YOpz-PLKtw7XAq',
          'https://drive.google.com/uc?export=download&id=1wKcCd5WEKa3gBo29v_YOpz-PLKtw7XAq'
    ][index], // اختيار الرابط بناءً على الفهرس
    'isPlaying': false, // حالة تشغيل الأغنية
  };
}),

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
  void _playMusic(int index) async {
    // التحقق إذا كان الصوت قيد التشغيل
    if (!tasks[index]['isPlaying']) {
      await _audioPlayer.play(tasks[index]['songUrl']);
      setState(() {
        tasks[index]['isPlaying'] = true; // تغيير حالة التشغيل للأغنية
      });
    }
  }

  // إيقاف الصوت
  void _stopMusic(int index) async {
    await _audioPlayer.stop();
    setState(() {
      tasks[index]['isPlaying'] = false; // تغيير حالة الأغنية إلى متوقفة
    });
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
              trailing: tasks[index]['task'].contains('Play Song')
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: tasks[index]['isPlaying']
                              ? null
                              : () => _playMusic(index), // تشغيل الصوت إذا لم يكن قيد التشغيل
                          child: Opacity(
                            opacity: tasks[index]['isPlaying'] ? 0.5 : 1.0, // تقليل شفافية الزر إذا كان معطلاً
                            child: Image.asset(
                              'assets/play_icon.png', // صورة تشغيل الصوت
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8), // مسافة صغيرة بين الصور
                        GestureDetector(
                          onTap: !tasks[index]['isPlaying']
                              ? null
                              : () => _stopMusic(index), // إيقاف الصوت إذا كان قيد التشغيل
                          child: Opacity(
                            opacity: !tasks[index]['isPlaying'] ? 0.5 : 1.0, // تقليل شفافية الزر إذا كان معطلاً
                            child: Image.asset(
                              'assets/stop_icon.png', // صورة إيقاف الصوت
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                      ],
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
