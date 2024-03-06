import 'package:flutter/material.dart';

class SehirSecWidget extends StatefulWidget {
  const SehirSecWidget({super.key});

  @override
  State<SehirSecWidget> createState() => _SehirSecWidgetState();
}

class _SehirSecWidgetState extends State<SehirSecWidget> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şehir Seç"),
      ),
      body: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Şehir",
                      hintText: "Şehir Seç"),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
              icon: Icon(Icons.add_location_alt_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
