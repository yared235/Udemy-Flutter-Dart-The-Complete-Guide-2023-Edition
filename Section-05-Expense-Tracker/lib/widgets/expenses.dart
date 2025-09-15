import 'package:flutter/material.dart';
import 'package:sec5_interactive/widgets/chart/chart.dart';
import 'package:sec5_interactive/widgets/expenses_list/expenses_list.dart';
import 'package:sec5_interactive/models/expense.dart';
import 'package:sec5_interactive/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'segege',
        amount: 30,
        category: Category.food,
        date: DateTime.now()),
    Expense(
        title: 'cinima',
        amount: 20,
        category: Category.leisure,
        date: DateTime.now())
  ];
  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (cxt) => NewExpense(
        addExpense: addExpense,
      ),
    );
  }

  void onRemovedExpense(Expense expense) {
    final expenseIndex=_registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Message Deleted'),
        action: SnackBarAction(label: 'undo', onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent;
    if (_registeredExpenses.isEmpty) {
      mainContent = const Center(
        child: Text('no expenses listed add to make some'),
      );
    } else {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemove: onRemovedExpense);
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter expense tracker'),
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add_box),
            ),
          ],
        ),
        body: Center(
          child: Column(children: [
            Chart(expenses: _registeredExpenses),
            Expanded(
              child: mainContent,
            )
          ]),
        ));
  }
}
