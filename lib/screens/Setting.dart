import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          child: ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              'About',
              style: TextStyle(
                  fontFamily: 'Sans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
