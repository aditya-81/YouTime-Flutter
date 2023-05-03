import 'package:flutter/material.dart';
import 'package:todoapp/screens/homepage.dart';

class Entry extends StatelessWidget {
  const Entry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF010536),
                image: DecorationImage(image: AssetImage("images/logo.png"))),
          ),
        ),
      ),
    );
  }
}
