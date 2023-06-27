import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speend/bar%20graph/bar_graph.dart';
import 'package:speend/data/expense_data.dart';
import 'package:speend/datetime/date_time_helper.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startoftheweek;
  const ExpenseSummary({super.key, required this.startoftheweek});

  @override
  Widget build(BuildContext context) {
    String monday =
        convertDatetostring(startoftheweek.add(const Duration(days: 0)));
    String tuesday =
        convertDatetostring(startoftheweek.add(const Duration(days: 1)));
    String wednesday =
        convertDatetostring(startoftheweek.add(const Duration(days: 2)));
    String thursday =
        convertDatetostring(startoftheweek.add(Duration(days: 3)));
    String friday =
        convertDatetostring(startoftheweek.add(const Duration(days: 4)));
    String saturday =
        convertDatetostring(startoftheweek.add(const Duration(days: 5)));
    String sunday =
        convertDatetostring(startoftheweek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MyBargraph(
          maxY: 1000,
          monAmount: value.calculatedailyexpense()[monday] ?? 0,
          tueAmount: value.calculatedailyexpense()[tuesday] ?? 0,
          wedAmount: value.calculatedailyexpense()[wednesday] ?? 0,
          thurAmount: value.calculatedailyexpense()[thursday] ?? 0,
          friAmount: value.calculatedailyexpense()[friday] ?? 0,
          satAmount: value.calculatedailyexpense()[saturday] ?? 0,
          sunAmount: value.calculatedailyexpense()[sunday] ?? 0,
        ),
      ),
    );
  }
}
