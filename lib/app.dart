import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iotappver2/config_wifi.dart';
import 'package:iotappver2/home.dart';
import 'package:iotappver2/home1.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Apps extends StatefulWidget {
  const Apps({super.key});

  @override
  State<Apps> createState() => _AppsState();
}

class _AppsState extends State<Apps> {


  int _currentIndex = 0;
  int page = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(
            () => _currentIndex = i,
          ),
          selectedItemColor: Colors.blue[500],
          unselectedItemColor: Colors.grey[400],
          selectedColorOpacity: 0.2,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          items: [
            SalomonBottomBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
                size: 20,
              ),
              title: Text("Home"),
            ),
            
            SalomonBottomBarItem(
              icon: Icon(
                Icons.add,
                size: 20,
              ),
              title: Text("Config"),
            ),
          
          ],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            InputScreen(),
            ConfigWifiPage(),
            
          ],
        ),
      );
  }
}
