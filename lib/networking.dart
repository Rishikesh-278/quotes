// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class Networking extends StatefulWidget {
//   const Networking({Key? key}) : super(key: key);
//
//   @override
//   State<Networking> createState() => _NetworkingState();
// }
//
//  getData() async
// {
//   var url = Uri.parse('https://goquotes-api.herokuapp.com/api/v1/random?count=1');
//   var response = await http.get(url);
//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');
//
//   var data = jsonDecode(response.body);
//   String quoteText = data["quotes"][0]["text"];
//   print(quoteText);
// }
//
// class _NetworkingState extends State<Networking> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }