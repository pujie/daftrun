import 'package:flutter/material.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});
  @override
  State<AddNote> createState() => _AddNote();
}

class _AddNote extends State<AddNote> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Penambahan Catatan"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("Simpan"),
      ),
    );
  }
}
