import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_expenses/components/chart/chart.dart';
import 'package:responsive_expenses/components/transaction/transaction_form.dart';
import 'package:responsive_expenses/components/transaction/transaction_list.dart';
import 'package:responsive_expenses/models/transaction.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransactions(String id) {
    setState(() {
      _transactions.removeWhere((tr) {
        return tr.id == id;
      });
    });
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(onSubmit: _addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    bool isLandScape = mediaQuery.orientation == Orientation.landscape;

    final mediaQueryHeight = mediaQuery.size.height;
    final mediaQueryPaddingTop = mediaQuery.padding.top;

    final PreferredSizeWidget appBar = AppBar(
      centerTitle: true,
      title: const Text("Despesas Pessoais"),
      actions: [
        if (isLandScape)
          IconButton(
            onPressed: () {
              setState(() {
                _showChart = !_showChart;
              });
            },
            icon: Icon(_showChart ? Icons.list : Icons.show_chart),
          ),
        IconButton(
          onPressed: () => _openTransactionFormModal(context),
          icon: const Icon(Icons.add),
        ),
      ],
    );

    final availableHeight =
        mediaQueryHeight - appBar.preferredSize.height - mediaQueryPaddingTop;

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_showChart || !isLandScape)
                SizedBox(
                  height: availableHeight * (isLandScape ? 0.8 : 0.3),
                  child: Chart(
                    recentTransactions: _recentTransactions,
                  ),
                ),
              if (!_showChart || !isLandScape)
                SizedBox(
                  height: availableHeight * (isLandScape ? 1 : 0.70),
                  child: TransactionList(
                    transaction: _transactions,
                    onRemove: _removeTransactions,
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
    );
  }
}
