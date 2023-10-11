import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:iotappver2/home.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('appled');
  String inputText = '';

  void _onColorSelectPressed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ColorPickerScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200, // Đặt kích thước rộng của TextField
              height: 50, // Đặt kích thước cao của TextField
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    inputText = text;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Nhập chữ...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _onColorSelectPressed(context),
              child: Text('Chọn màu sắc'),
            ),
            SizedBox(height: 20),
           
            ElevatedButton(
              onPressed: () {
                _databaseReference.child('text').set(inputText);
                // In thông báo sau khi gửi dữ liệu
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Dữ liệu đã được gửi lên Firebase!'),
                  ),
                );
              },
              child: Text('Xác nhận'),
            ),
          ],
        ),
      ),
    );
  }
}
