import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen_budget/data/models/transaction_model.dart';
import 'package:zen_budget/data/repositories/transaction_repository.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = context.watch<TransactionRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        centerTitle: true,
      ),
      body: repo.transactions.isEmpty
          ? const Center(child: Text('No transactions yet'))
          : ListView.builder(
              itemCount: repo.transactions.length,
              itemBuilder: (context, index) {
                final t = repo.transactions[index];
                return ListTile(
                  title: Text(t.title),
                  subtitle: Text('\$${t.amount.toStringAsFixed(2)}'),
                  trailing: Text(
                    '${t.date.month}/${t.date.day}/${t.date.year}',
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newT = TransactionModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            title: 'Sample ${repo.count + 1}',
            amount: (5 + repo.count).toDouble(),
            date: DateTime.now(),
          );
          repo.addTransaction(newT);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
