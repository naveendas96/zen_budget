import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen_budget/data/repositories/transaction_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = context.watch<TransactionRepository>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Home Screen — placeholder'),
            const SizedBox(height: 12),
            Text('Local transactions: ${repo.count}'),
          ],
        ),
      ),
    );
  }
}
