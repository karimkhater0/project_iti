import 'package:flutter/material.dart';

class DevelopersScreen extends StatelessWidget {
  const DevelopersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developers'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
           '''Developed by:
   
   -Karim Khater.''',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),


          ),
        ),
      ),
    );
  }
}
