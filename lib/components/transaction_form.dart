import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptative_button.dart';

class TransationForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransationForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransationForm> createState() => _TransationFormState();
}

class _TransationFormState extends State<TransationForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: _valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                decoration: const InputDecoration(
                  labelText: 'Value (U\$)',
                ),
              ),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No data selected'
                            : 'Date selected: ${DateFormat('dd/MM/y').format(_selectedDate!)}',
                      ),
                    ),
                    TextButton(
                      onPressed: _showDatePicker,
                      child: const Text(
                        'Select a date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                 AdaptativeButton('New Transaction', _submitForm),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
