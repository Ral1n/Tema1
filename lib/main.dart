import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? error;
  double convert = 0;
  String enteredText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Convertor'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(

        children: <Widget>[
          Image.network(
              'https://thumbs.dreamstime.com/b/romanian-money-ron-background-one-million-banknotes-national-83878054.jpg',
            fit: BoxFit.fitHeight,
          ),
          TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onChanged: (value){
              enteredText = value;
              double? verificare = double.tryParse(enteredText);
              if(verificare == null) {
                error = 'Nu ati introdus o valoare numerica';
              }else {
                error = null;
              }
            },
            decoration: InputDecoration(
              hintText: 'Introduceti o valoare in euro',
              errorText: error,
            ),
          ),
          SizedBox(
              height: 20
          ),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  double? valoare = double.tryParse(enteredText) ?? 0;
                  convert = valoare * 4.91;
                });
              },
              child: Text('CONVERT')
          ),
          SizedBox(
              height: 20
          ),
          Text(
              style: TextStyle(fontSize: 40),
              '$convert RON'
          ),
        ],
      ),
    );
  }
}
  

