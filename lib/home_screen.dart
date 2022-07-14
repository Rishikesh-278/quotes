import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'networking.dart' as network;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String quote = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body:Column(
        children: <Widget> [
          Text(quote),
          ElevatedButton(
            onPressed: () async {
              var url = Uri.parse('https://goquotes-api.herokuapp.com/api/v1/random?count=1');
              var response = await http.get(url);
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');

              var data = jsonDecode(response.body);
              quote = data["quotes"][0]["text"];

              setState(() {});
            },
            child: Text("Get quote"),
          )
        ],
      ),
    );
  }
}