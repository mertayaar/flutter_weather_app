import 'package:flutter/material.dart';

class SelectCity extends StatelessWidget {
  const SelectCity({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final _textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select City"),
      ),
      body: Form(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: "City",
                    hintText: "City Name",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context, _textController.text);
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}