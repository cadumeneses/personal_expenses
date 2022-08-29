import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';

class Chart extends StatelessWidget {
  const Chart(this.recentTransaction, {Key? key}) : super(key: key);

  final List<Transaction> recentTransaction;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      return {'day': 'T', 'value': 8.99};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
