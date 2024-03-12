import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  FlutterTts flutterTts = FlutterTts();
  TextEditingController textEditingController = TextEditingController();
  String textToRead = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text to Speech'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(labelText: 'Enter Text To Speech'),
                onChanged: (value) {
                  setState(() {
                    textToRead = value;
                  });
                },
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  _speak();
                },
                child: Text('Speak'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future _speak() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(textToRead);
  }
}
