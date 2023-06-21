import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ResponseModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
TextEditingController number=TextEditingController();
String data='null';
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          TextFormField(controller: number,
            decoration: InputDecoration(hintText: 'Enter Your Text'),
          ),SizedBox(height: 30,),

          TextButton(onPressed: ()async{

            final result=await getData(number: int.parse(number.text.toString()));
            setState(() {
              data=result.text.toString()??'';
            });

            },
              child: Text("Send")),
          SizedBox(height: 30,),
          Text(data)
        ],
      ),
    );
  }
}

Future<ResponseModel> getData({required int number}) async {
  final String serverUrl = "http://numbersapi.com/$number?json";
  final response = await http.get(Uri.parse(serverUrl));

  final result=jsonDecode(response.body);
  return ResponseModel.fromJson(result);
}
