import 'package:flutter/material.dart';
import 'adaptatives/adaptative_button.dart';
import 'adaptatives/adaptative_textfield.dart';
import 'adaptatives/adaptative_datepicker.dart';

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
              AdaptativeTextField(
                label: 'Title',
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptativeTextField(
                controller: _valueController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                label: 'Value (R\$)',
              ),
              AdaaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChange: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
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
