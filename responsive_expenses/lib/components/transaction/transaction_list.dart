import 'package:flutter/material.dart';
import 'package:responsive_expenses/components/transaction/transaction_item.dart';
import 'package:responsive_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final void Function(String) onRemove;

  const TransactionList({
    super.key,
    required this.transaction,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    bool isLandScape = mediaQuery.orientation == Orientation.landscape;

    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * (isLandScape ? 0.15 : 0.05),
                ),
                Text(
                  "Nenhuma Transação Cadastrada !",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(height: constraints.maxHeight * 0.10),
                SizedBox(
                  height: constraints.maxHeight * 0.60,
                  child: Image.asset(
                    "asset/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (ctx, index) {
              final tr = transaction[index];

              return TransactionItem(
                tr: tr,
                mediaQuery: mediaQuery,
                onRemove: onRemove,
              );
            },
          );
  }
}
