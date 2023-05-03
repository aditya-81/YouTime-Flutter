import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todoapp/constants.dart';
import 'package:http/http.dart' as http;

class NutrientFact extends StatefulWidget {
  @override
  State<NutrientFact> createState() => _NutrientFactState();
}

class _NutrientFactState extends State<NutrientFact> {
  late String inputdata;

  // late Future<Album> futureAlbum;
  late double proteins = 0;
  late double carbs = 0;

  late double fibers = 0;

  late double fats = 0;
  late var data;
  String name = "Ingredient";
  int len = 1;
  @override
  void initState() {
    // TODO: implement initState
    fetch();
  }

  @override
  Future fetch({String ing = 'chicken'}) async {
    const String api_id = "e6cf4ff4";
    const String api_key = "22816f296181198764f48d43c7db31d3";
    var response = await http.get(
      Uri.parse(
          "https://api.edamam.com//api//food-database//v2//parser?app_id=e6cf4ff4&app_key=22816f296181198764f48d43c7db31d3&ingr=$ing&nutrition-type=cooking"),
    );
    if (response.statusCode == 200) {
      // print(response.body);
      data = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Data/100g',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                inputdata = value;
              },
            )),
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            FactEntry("Protein", proteins.toString()),
            FactEntry("Carbohydrates", carbs.toString()),
            FactEntry("Fats", fats.toString()),
            FactEntry("Fiber", fibers.toString()),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                color: kBottomButtonColor,
                width: double.infinity,
                height: kBottomButtonHeight,
                child: Text(
                  "SEARCH",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                ),
              ),
              onTap: () async {
                if (inputdata != null) {
                  await fetch(ing: inputdata);
                  setState(() {
                    len = data["parsed"].length;
                    name = data["parsed"][0]["food"]["label"];
                    proteins = data["parsed"][0]["food"]["nutrients"]["PROCNT"];
                    fats = data["parsed"][0]["food"]["nutrients"]["FAT"];
                    carbs = data["parsed"][0]["food"]["nutrients"]["CHOCDF"];
                    fibers = data["parsed"][0]["food"]["nutrients"]["FIBTG"];
                  });
                }

                print(proteins);
              },
            ),
          ],
        ));
  }
}

class FactEntry extends StatelessWidget {
  FactEntry(this.label, this.data);
  late String label;
  late String data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Container(
          decoration: kContainerDecoration,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: Text(
                label,
                style: TextStyle(fontSize: 20),
              )),
              Center(child: Text(data, style: TextStyle(fontSize: 20)))
            ],
          ),
        ),
      ),
    );
  }
}
