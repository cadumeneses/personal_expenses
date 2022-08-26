import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Expenses'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Text('Graphic'),
              elevation: 5,
              color: Colors.blue,
            ),
          ),
          Card(
            child: Text('Trasations list'),
          )
        ],
      ),
    );
  }
}
