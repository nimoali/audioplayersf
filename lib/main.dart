// import 'package:flutter/material.dart';
// import 'package:hardwork/NotesScreen.dart';
// import 'package:hardwork/ProfileScreen.dart';
// import 'package:hardwork/TasksScreen.dart';
// import 'package:hardwork/foucs.dart';
// // import 'package:quran/NotesScreen.dart';
// // import 'package:quran/ProfileScreen.dart';
// // import 'package:quran/TasksScreen.dart';
// // import 'package:quran/focus.dart';

// void main() {
//   runApp(StudyHardApp());
// }

// class StudyHardApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Study Hard',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//         scaffoldBackgroundColor: Color(0xFFF9FBFC),
//         fontFamily: 'Roboto',
//       ),
//       home: MainScreen(),
//     );
//   }
// }

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     HomeScreen(),
//     FocusScreen(),
//     TasksScreen(),
//     NotesScreen(),
//     ProfileScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.black45,
//         backgroundColor: Color(0xFFEAF4FA),
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Focus'),
//           BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline), label: 'Tasks'),
//           BottomNavigationBarItem(icon: Icon(Icons.notes), label: 'Notes'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

// // ---------------- Home Screen ----------------

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Home',
//                 style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black)),
//             SizedBox(height: 16),
//             Text('Welcome back, Luke',
//                 style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.black87)),
//             SizedBox(height: 24),
//             Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Color(0xFFDDEEFF),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: TextButton(
//                   onPressed: () {
//                     // Optionally switch to Focus tab
//                   },
//                   child: Padding(
//                     padding:
//                     const EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
//                     child: Text(
//                       'START POMODORO',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 32),
//             Text("Today’s Tasks",
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black)),
//             SizedBox(height: 30),
//             TaskItem(task: "Finish math assignment"),
//             TaskItem(task: "Read 2 chapters of book"),
//             TaskItem(task: "Review biology notes"),
//             SizedBox(height: 32),
//             Text("Quote of the Day",
//                 style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black)),
//             SizedBox(height: 12),
//             Text(
//               '"The secret of getting ahead is getting started."',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontStyle: FontStyle.italic,
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TaskItem extends StatelessWidget {
//   final String task;
//   const TaskItem({required this.task});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12.0),
//       child: Row(
//         children: [
//           Icon(Icons.radio_button_unchecked, color: Colors.lightBlue),
//           SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               task,
//               style: TextStyle(fontSize: 16, color: Colors.black87),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ---------------- Other Screens ----------------


// //
// // class TasksScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(child: Text('Tasks Screen'));
// //   }
// // }
// //
// // class NotesScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(child: Text('Notes Screen'));
// //   }
// // }

// // class ProfileScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(child: Text('Profile Screen'));
// //   }
// // }



import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AudioPlayerScreen(),
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    playAudio();
  }

  Future<void> playAudio() async {
    await _player.setReleaseMode(ReleaseMode.stop);
    await _player.setSourceUrl(
        'https://thegrowingdeveloper.org/files/audios/quiet-time.mp3?b4869097e4');
    await _player.resume();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Playing Audio')),
      body: const Center(child: Text('Audio from the internet is playing...')),
    );
  }
}


