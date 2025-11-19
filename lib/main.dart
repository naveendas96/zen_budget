import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zen_budget/ui/screens/home_screen.dart';
import 'package:zen_budget/ui/screens/transactions_screen.dart';
import 'package:zen_budget/ui/screens/budgets_screen.dart';
import 'package:zen_budget/ui/screens/settings_screen.dart';
import 'package:zen_budget/data/repositories/transaction_repository.dart';

void main() {
  runApp(const ZenBudgetApp());
}

class ZenBudgetApp extends StatelessWidget {
  const ZenBudgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TransactionRepository>(
      create: (_) => TransactionRepository()..loadInitialData(),
      child: MaterialApp(
        title: 'ZenBudget',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        home: const MainScaffold(),
      ),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    TransactionsScreen(),
    BudgetsScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Budgets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
