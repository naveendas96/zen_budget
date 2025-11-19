import 'package:flutter/foundation.dart';
import '../models/transaction_model.dart';

class TransactionRepository extends ChangeNotifier {
  final List<TransactionModel> _transactions = [];

  List<TransactionModel> get transactions => List.unmodifiable(_transactions);

  void loadInitialData() {
    // Simulate loading from local DB/cache
    _transactions.clear();
    _transactions.addAll(
      [
        TransactionModel(
          id: 't1',
          title: 'Coffee',
          amount: 3.50,
          date: DateTime.now().subtract(const Duration(days: 1)),
        ),
        TransactionModel(
          id: 't2',
          title: 'Groceries',
          amount: 42.10,
          date: DateTime.now().subtract(const Duration(days: 2)),
        ),
      ],
    );
    notifyListeners();
  }

  void addTransaction(TransactionModel t) {
    _transactions.insert(0, t);
    // In a real offline-first app, you would persist locally here and
    // schedule a background sync to the server.
    notifyListeners();
  }

  int get count => _transactions.length;
}
