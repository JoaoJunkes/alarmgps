import 'package:flutter/material.dart';

class AlarmInput extends StatelessWidget {

  final descriptionController = TextEditingController();
  final distanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black45,
      title: Text('Novo Alarme', style: TextStyle(color: Colors.white),),
      content: Container(
        height: 200,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: descriptionController,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Descrição',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            TextFormField(
              controller: distanceController,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: 'Despertar há (Metros)',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 150.0, right: 0.0),
              child: RaisedButton(
                textColor: Colors.black,
                color: Colors.white,
                child: Text("Gravar"),
                onPressed: () {
                  Navigator.pop(context);
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

