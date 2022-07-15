import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'networking.dart' as network;
import 'dart:convert';

String quote = "";

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Colors.yellow,
      color: Colors.red,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        var url = Uri.parse(
            'https://goquotes-api.herokuapp.com/api/v1/random?count=1');
        var response = await http.get(url);
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        var data = jsonDecode(response.body);
        quote = data["quotes"][0]["text"];

        await Future.delayed(Duration(microseconds: 1500));

        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home screen"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: <Widget> [
            TestText(),

          ],
        ),
        //NoName(),
      ),
    );
  }
}

/*
async {
                var url = Uri.parse('https://goquotes-api.herokuapp.com/api/v1/random?count=1');
                var response = await http.get(url);
                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body}');

                var data = jsonDecode(response.body);
                quote = data["quotes"][0]["text"];

                setState(() {});
              }
 */ //API data fetch

Widget TestText() {
  return ListView(
    padding: EdgeInsets.all(8),
    children: <Widget>[
      Container(
        child: Text(quote),
      ),
      Container(
        child: Text(quote),
      ),
    ],
  );
}

/*
class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
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
        ),

      ],
    );
  }
}
 */