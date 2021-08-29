import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditNote extends StatelessWidget {

  var controller = TextEditingController();

  var note;

  EditNote({this.note});

  @override
  Widget build(BuildContext context) {

    if(note!=null) controller.text = note;

    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar nota"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
              ),
            ),
            ElevatedButton(
                onPressed:() => onPressed(context),
                child: Text("Guardar")
            )
          ],
        ),
      ),
    );
  }


  void onPressed(BuildContext context) {
    final note = controller.text;
    Navigator.pop(context, note );

  }
}
