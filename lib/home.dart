
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerScreen extends StatefulWidget {
  @override
  _ColorPickerScreenState createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  Color selectedColor = Colors.blue;
    final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('appled');
  void _updateColor(Color color) {
    setState(() {
      selectedColor = color;
       _databaseReference.child('red').set("${selectedColor.red}");
       _databaseReference.child('green').set("${selectedColor.green}");

       _databaseReference.child('blue').set("${selectedColor.blue}");

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: selectedColor,
            ),
            SizedBox(height: 20),
            Text(
              'Mã RGB: ${selectedColor.red}, ${selectedColor.green}, ${selectedColor.blue}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ColorPicker(
              pickerColor: selectedColor,
              onColorChanged: _updateColor,
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ],
        ),
      ),
    );
  }
}