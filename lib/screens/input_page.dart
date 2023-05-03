import 'package:todoapp/BMI_cal/Calculation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'resultpage.dart';
import 'package:todoapp/constants.dart';

const double BottomButtonHeight = 80.0;
// const Color kContainerColor = Color(0xFF192a45);
// const Color kactiveContainer = Color(0xFF0d1e2e);
// const Color kBottomButtonColor = Color(0xFFc73053);
int height = 180;
int weight = 60;
int age = 18;

enum gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late gender selectedgender = gender.male;

  Color malebuttoncolor = kContainerColor;
  Color femalebuttomcolor = kContainerColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedgender = gender.male;
                          });
                        },
                        child: ReusingContainer(
                          malebuttoncolor = gender.male == selectedgender
                              ? kActiveContainer
                              : kContainerColor,
                          cardChild: IconContent(FontAwesomeIcons.mars, "MALE"),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedgender = gender.female;
                          });
                        },
                        child: ReusingContainer(
                          femalebuttomcolor = selectedgender == gender.female
                              ? kActiveContainer
                              : kContainerColor,
                          cardChild:
                              IconContent(FontAwesomeIcons.venus, "FEMALE"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ReusingContainer(
                        kContainerColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("HEIGHT"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: TextStyle(
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text("cm")
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: Colors.pinkAccent,
                                  thumbColor: Colors.pinkAccent,
                                  overlayColor: Color(0x35FF4081),
                                  thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 16,
                                  ),
                                  overlayShape: RoundSliderOverlayShape(
                                      overlayRadius: 25)),
                              child: Slider(
                                  value: height.toDouble(),
                                  min: 100,
                                  max: 300,
                                  onChanged: (double newValue) {
                                    setState(() {
                                      height = newValue.round();
                                    });
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ReusingContainer(
                        kContainerColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "WEIGHT",
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  weight.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundButton(
                                  FontAwesomeIcons.minus,
                                  pressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                RoundButton(FontAwesomeIcons.plus, pressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ReusingContainer(
                        kContainerColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AGE",
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  age.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 30),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RoundButton(
                                  FontAwesomeIcons.minus,
                                  pressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                RoundButton(FontAwesomeIcons.plus, pressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Calculator cal = Calculator(weight, height);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ResultPage(cal.bmical(), cal.res(), cal.inter()),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 10),
                  color: kBottomButtonColor,
                  width: double.infinity,
                  height: BottomButtonHeight,
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class IconContent extends StatelessWidget {
  IconContent(this.ic, this.label);

  final IconData ic;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(ic, size: 80),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}

class ReusingContainer extends StatelessWidget {
  ReusingContainer(this.c, {this.cardChild});

  final Color c;
  final cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration:
          BoxDecoration(color: c, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton(this.icon, {required this.pressed});

  final IconData icon;
  final Function() pressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressed,
      child: Icon(
        icon,
        size: 30,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Color(0xFF4c4f4e),
      shape: CircleBorder(),
    );
  }
}
