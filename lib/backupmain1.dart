import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:daftrun/pages/add_note.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => const Home(),
    '/addnote': (context) => const AddNote()
  }));
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final TextEditingController _x = TextEditingController();
  final List<String> entries = <String>['A', 'B'];
  @override
  void dispose() {
    _x.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftrun v1.0')),
      body: ListView.separated(
        padding: const EdgeInsets.all(30.0),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber,
            child: Center(
              child: Text('Entry ${entries[index]}'),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addnote');
        },
        child: const Text("+"),
      ),
    );
  }
}
