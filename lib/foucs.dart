import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// ✅ Use a stable working MP3
const String lofiUrl = 'https://samplelib.com/lib/preview/mp3/sample-3s.mp3';


class FocusScreen extends StatefulWidget {
  @override
  _FocusScreenState createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlayingMusic = false;

  Duration _duration = Duration(minutes: 25);
  late Timer _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer.setReleaseMode(ReleaseMode.loop); // 🎵 keep playing
  }

  Future<void> _toggleMusic() async {
    try {
      if (_isPlayingMusic) {
        print("Music button tapped");
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.setSource(UrlSource(lofiUrl));
        await _audioPlayer.resume();
      }
      setState(() {
        _isPlayingMusic = !_isPlayingMusic;
      });
    } catch (e) {
      print("Audio Error: $e");
    }
  }

  void _startTimer() {
    if (_isRunning) return;
    _isRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_duration.inSeconds == 0) {
        timer.cancel();
        _isRunning = false;
      } else {
        setState(() {
          _duration = _duration - Duration(seconds: 1);
        });
      }
    });
  }

  void _pauseTimer() {
    _timer.cancel();
    _isRunning = false;
  }

  void _resetTimer() {
    if (_isRunning) _timer.cancel();
    setState(() {
      _duration = Duration(minutes: 25);
      _isRunning = false;
    });
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  void dispose() {
    if (_isRunning) _timer.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = 1 - (_duration.inSeconds / (25 * 60));

    return Scaffold(
      backgroundColor: Color(0xFFF9FBFC),
      body: SafeArea(
        child: Column(
          children: [
            // Back & Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new, size: 20),
                  SizedBox(width: 10),
                  Text('Focus',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Timer circle
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 8,
                    backgroundColor: Colors.blue[100],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                ),
                Text(
                  _formatTime(_duration),
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 40),

            // Timer buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _isRunning ? _pauseTimer : _startTimer,
                  icon: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
                  label: Text(_isRunning ? 'Pause' : 'Start'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDDEEFF),
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: _resetTimer,
                  icon: Icon(Icons.stop),
                  label: Text('End'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDDEEFF),
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // 🎵 Music control
            TextButton.icon(
              onPressed: _toggleMusic,
              icon: Icon(
                _isPlayingMusic ? Icons.pause_circle : Icons.play_circle,
                color: Colors.black54,
              ),
              label: Text(
                "Lo-Fi",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
