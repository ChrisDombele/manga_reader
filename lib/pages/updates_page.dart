import 'package:flutter/material.dart';

class UpdatesPage extends StatefulWidget {
  @override
  _UpdatesPageState createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Updates"),
      ),
      body: Center(
        child: Text(
          "Updating...",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
