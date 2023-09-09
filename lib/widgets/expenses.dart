// import 'package:expense_planner/widgets/expenses_list/expenses_list.dart';
import 'expenses_lists/expenses_list.dart';
import 'package:expense_planner/models/expense.dart';
import 'package:flutter/material.dart';
import 'new_expense.dart';

import './chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(
        amount: 10.99,
        date: DateTime.now(),
        title: "Flutter course",
        category: Category.work),
    Expense(
        amount: 13.99,
        date: DateTime.now(),
        title: "Cinema",
        category: Category.leisure)
  ];

  void _showModalBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(
            onAddExpense: _addExpense,
          );
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _expenses.indexOf(expense);

    setState(() {
      _expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text("Expense is deleted"),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
          label: 'Unde',
          onPressed: () {
            setState(() {
              _expenses.insert(expenseIndex, expense);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No Expenses yet"),
    );

    if (_expenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _expenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Planner"),
        actions: [
          IconButton(
              onPressed: _showModalBottomSheet, icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _expenses),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
