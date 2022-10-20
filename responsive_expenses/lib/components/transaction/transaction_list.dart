import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          "R\$${tr.value}",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat("d MMM y").format(tr.date),
                  ),
                  trailing: mediaQuery.size.width > 480
                      ? TextButton.icon(
                          onPressed: () => onRemove(tr.id),
                          icon: const Icon(Icons.delete),
                          label: const Text("Excluir"),
                          style: TextButton.styleFrom(
                            foregroundColor: Theme.of(context).errorColor,
                          ),
                        )
                      : IconButton(
                          onPressed: () => onRemove(tr.id),
                          icon: const Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                        ),
                ),
              );
            },
          );
  }
}
