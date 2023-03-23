import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptiveDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateChanged;

  const AdaptiveDatePicker({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2025),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: Text(
              selectedDate == null
                  ? "Nenhuma data selecionada!"
                  : "Data Selecionada: ${DateFormat("d/MM/y").format(selectedDate!)}",
            ),
          ),
          TextButton(
            onPressed: () => _showDatePicker(context),
            child: const Text(
              "Selecionar Data",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
