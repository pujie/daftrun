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
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Harus diisi';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
