import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({required this.transactions, Key? key})
      : super(key: key);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tr) {
        return Card(
          child: Row(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple.shade50,
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  'U\$ ${tr.value.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr.title,
                    style: const TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    DateFormat('d MM y').format(tr.date),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
