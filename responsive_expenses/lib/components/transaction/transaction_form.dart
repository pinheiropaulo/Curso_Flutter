import 'package:flutter/material.dart';
import 'package:responsive_expenses/components/adaptive/adaptive_date_picker.dart';
import 'package:responsive_expenses/components/adaptive/adaptive_text_field.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  DateTime? _selectedDate = DateTime.now();

  @override
  void dispose() {
    super.dispose();
    _titleController;
    _valueController;
    _selectedDate;
  }

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
            top: 20,
            right: 10,
            left: 10,
            bottom: 20 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptiveTextField(
                label: "Titulo",
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
              ),
              AdaptiveTextField(
                label: "Valor (R\$)",
                controller: _valueController,
                onSubmitted: (_) => _submitForm(),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              AdaptiveDatePicker(
                  selectedDate: _selectedDate,
                  onDateChanged: (newDate) {
                    setState(() {
                      _selectedDate = newDate;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: _submitForm,
                    child: const Text('Nova Transação'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
