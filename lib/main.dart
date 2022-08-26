import 'package:flutter/material.dart';
import 'components/transaction_user.dart';

main() => runApp(const ExpensesApp());

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          SizedBox(
            child: Card(
              elevation: 5,
              color: Colors.blue,
              child: Text('Graphic'),
            ),
          ),
          TransationUser(),
        ],
      ),
    );
  }
}
