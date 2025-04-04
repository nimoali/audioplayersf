import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  String _note = '';
  final TextEditingController _controller = TextEditingController();

  void _saveNote() {
    setState(() {
      _note = _controller.text.trim();
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FBFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(Icons.arrow_back_ios_new, size: 20),
                  SizedBox(width: 10),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 24),

              // Input for note
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Write your note here...',
                  filled: true,
                  fillColor: Color(0xFFEAF4FA),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 16.0),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 12),

              // Save button
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _saveNote,
                  child: Text('add Note'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFDDEEFF),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),

              // Display saved note
              if (_note.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFFDDEEFF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Study Hard',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text(_note,
                          style: TextStyle(fontSize: 16, height: 1.4)),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
