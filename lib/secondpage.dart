import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:prc/Modelclass/modeclass.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  void initState() {
    getlink();
    // TODO: implement initState
    super.initState();
  }

  List mylist = [];
  late Modelclass object;
  Future getlink() async {
    String mylink =
        "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json?fbclid=IwAR14-zBvr4aAilr0BzBX_fSQa1RotbkTHdrMCfKoQ7hLUuBC4JgtJD2exFY";

    var response = await http.get(Uri.parse(mylink));
    // print(response.body);
    var mydata = jsonDecode(response.body)['exercises'];

    for (var i in mydata) {
      object = Modelclass(
          i['id'], i['title'], i['thumbnail'], i['gif'], i['seconds']);

      setState(() {
        mylist.add(object);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("EXERCISE"),
        ),
        body: ListView.builder(
            itemCount: mylist.length,
            itemBuilder: ((context, index) {
              return Card(
                child: ListTile(
                  title: Text("${mylist[index].id}"),
                  subtitle: Text("${mylist[index].title}"),
                ),
              );
            })),
      ),
    );
  }
}
