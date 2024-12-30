import 'package:flutter/material.dart';

class NotepadPage extends StatefulWidget {
  final String token;

  NotepadPage({required this.token});

  @override
  _NotepadPageState createState() => _NotepadPageState();
}

class _NotepadPageState extends State<NotepadPage> {
  final List<String> _notes = [];
  final _noteController = TextEditingController();

  void _addNote() {
    final note = _noteController.text.trim();
    if (note.isNotEmpty) {
      setState(() {
        _notes.add(note);
        _noteController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: 'Write your note here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addNote,
            child: Text('Add Note'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_notes[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
