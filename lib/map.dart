import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;

class MapDemo extends StatefulWidget {
  const MapDemo({super.key});

  @override
  State<MapDemo> createState() => _MapDemoState();
}

class _MapDemoState extends State<MapDemo> {
  Map<String, dynamic>? weathermap;
  Map<String, dynamic>? forecaste;

  getlink() async {
    String mylink =
        "https://api.openweathermap.org/data/2.5/weather?lat=37.4219983&lon=-122.084&units=metric&appid=f92bf340ade13c087f6334ed434f9761&fbclid=IwAR0yzxWOuwiqUfKBxUAA9H8IVdKcn-2qSQHye8BKAAtZA6VGEfx_SIwE124";

    var getlink = await http.get(Uri.parse(mylink));
    String mylink2 =
        "https://api.openweathermap.org/data/2.5/forecast?lat=37.4219983&lon=-122.084&units=metric&appid=f92bf340ade13c087f6334ed434f9761&fbclid=IwAR0yzxWOuwiqUfKBxUAA9H8IVdKcn-2qSQHye8BKAAtZA6VGEfx_SIwE124";

    var getlink2 = await http.get(Uri.parse(mylink2));
    //print(getlink.body);

    setState(() {
      weathermap = Map<String, dynamic>.from(jsonDecode(getlink.body));
      forecaste = Map<String, dynamic>.from(jsonDecode(getlink2.body));
    });
  }

  @override
  void initState() {
    getlink();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Weather_App"),
        ),
        body: ListView(
          children: [
            Text("${weathermap!['name']}"),
            Text("${forecaste!['list'][0]['clouds']['all']}")
          ],
        ),
      ),
    );
  }
}
