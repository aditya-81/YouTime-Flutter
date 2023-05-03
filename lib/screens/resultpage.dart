import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:todoapp/constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(this.bmi, this.result, this.interp);
  final String bmi;
  final String result;
  final String interp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Your Result",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800),
              ),
            )),
            Expanded(
              flex: 5,
              child: ReusingContainer(
                kContainerColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      result,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.lightGreen,
                          fontSize: 20),
                    ),
                    Text(
                      bmi,
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    Text(interp,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                color: kBottomButtonColor,
                width: double.infinity,
                height: BottomButtonHeight,
                child: Text(
                  "RE-CALCULATE",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
