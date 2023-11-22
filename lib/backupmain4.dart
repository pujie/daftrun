import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:daftrun/pages/add_note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final List<dynamic>? notes = GetNotes();
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
          //Navigator.pushNamed(context, '/addnote');
          const GetNotes();
        },
        child: const Text("+"),
      ),
    );
  }
}

class GetNotes extends StatelessWidget {
  final String documentId = "tes";
  const GetNotes({super.key});
  @override
  Widget build(BuildContext context) {
    CollectionReference notes = FirebaseFirestore.instance.collection('mynote');
    return FutureBuilder<DocumentSnapshot>(
        future: notes.doc(documentId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Eror");
          }
          if (snapshot.hasData && snapshot.data!.exists) {
            return const Text("Tidak ada data");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            //print(" ${data['subject']}");
            //return Text(" ${data['subject']}");
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: data['subject'],
                    ),
                  );
                });
          }

          return const Text("Loading");
        });
  }
}
