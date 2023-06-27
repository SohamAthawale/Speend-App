import 'package:flutter/material.dart';
import 'package:speend/datetime/date_time_helper.dart';
import 'package:speend/models/expense_item.dart';

class ExpenseData extends ChangeNotifier {
  List<Expenseitems> overallexpense = [];

  List<Expenseitems> getallExpenseList() {
    return overallexpense;
  }

  void addNewExpense(Expenseitems newExpense) {
    overallexpense.add(newExpense);
    notifyListeners();
  }

  void deleteExpense(Expenseitems expense) {
    overallexpense.remove(expense);
    notifyListeners();
  }

  String getDayname(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  DateTime startofWeekDate() {
    DateTime? startofWeek;
    DateTime today = DateTime.now();

    for (int i = 0; i < 7; i++) {
      if (getDayname(today.subtract(Duration(days: i))) == 'Sun') {
        startofWeek = today.subtract(Duration(days: i));
      }
    }
    return startofWeek!;
  }

  Map<String, double> calculatedailyexpense() {
    Map<String, double> dailyexpense = {};
    for (var expense in overallexpense) {
      String date = convertDatetostring(expense.dateTime);
      double ammount = double.parse(expense.Ammount);

      if (dailyexpense.containsKey(date)) {
        double currentAmmount = dailyexpense[date]!;
        currentAmmount += ammount;
        dailyexpense[date] = currentAmmount;
      }
    }
    return dailyexpense;
  }
}
