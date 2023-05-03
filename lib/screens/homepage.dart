import 'package:flutter/material.dart';
import 'package:todoapp/constants.dart';
import 'package:todoapp/screens/tasks_screen.dart';
import 'input_page.dart';
import 'nutrientpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'You-Time',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ContainerButton("BMI CALCULATOR", () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => InputPage()));
          }, AssetImage('images/heart.png')),
          ContainerButton("NUTRIENT CALCULATOR", () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NutrientFact()));
          }, AssetImage('images/fruits.png')),
          ContainerButton("To-Do list", () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => TasksScreen()));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TasksScreen()));
          }, AssetImage('images/lis.png')),
        ],
      ),
    );
  }
}

class ContainerButton extends StatelessWidget {
  ContainerButton(this.buttontext, this.ontap, this.img);
  late AssetImage img;
  late String buttontext;
  late Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: GestureDetector(
          onTap: ontap,
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: kContainerDecoration.copyWith(
                image: DecorationImage(image: img)),
            // child: Text(
            //   buttontext,
            //   style: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.w900,
            //       color: Colors.white),
            // ),
          )),
    ));
  }
}
