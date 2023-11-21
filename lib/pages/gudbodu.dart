import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});
  @override
  State<AddNote> createState() => _AddNote();
}

class _AddNote extends State<AddNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Penambahan Note")),
      body: Column(
        children: [
          const SearchBar(),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
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
    );
  }
}
