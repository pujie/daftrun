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
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print("ttappe");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.grey,
                          height: 100,
                        ),
                      ),
                    );
                  }))
        ],
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
