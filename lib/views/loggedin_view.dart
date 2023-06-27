import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:speend/data/expense_data.dart';
import 'package:speend/models/expense_item.dart';
import 'package:speend/views/account_view.dart';
import 'package:speend/views/login_view.dart';
import 'package:speend/views/profile_view.dart';
import 'package:speend/views/setting_view.dart';
import 'package:speend/views/stats_view.dart';

class LoggedinView extends StatefulWidget {
  const LoggedinView({super.key});

  @override
  State<LoggedinView> createState() => _LoggedinViewState();
}

class _LoggedinViewState extends State<LoggedinView> {
  final newExpensename = TextEditingController();
  final newExpenseammount = TextEditingController();
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newExpensename,
            ),
            TextField(
              controller: newExpenseammount,
            )
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: save,
            child: Text('Save'),
          ),
          MaterialButton(
            onPressed: cancel,
            child: Text('Cancel'),
          )
        ],
      ),
    );
  }

  void save() {
    Expenseitems newExpense = Expenseitems(
        Name: newExpensename.text,
        Ammount: newExpenseammount.text,
        dateTime: DateTime.now());
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
  }

  void clear() {
    newExpenseammount.clear();
    newExpensename.clear();
  }

  int _selectedIndex = 0;
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: const Color.fromARGB(255, 58, 52, 62),
                actions: [
                  PopupMenuButton(
                      color: Color.fromARGB(255, 224, 224, 224),
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem<int>(
                            value: 0,
                            child: Text("Setting"),
                          ),
                          const PopupMenuItem<int>(
                              value: 1, child: Text('Logout'))
                        ];
                      },
                      onSelected: (value) {
                        if (value == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingView()));
                        }
                        if (value == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginView()));
                        }
                      }),
                ],
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      style: ButtonStyle(
                          iconColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 224, 224, 224))),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()),
                        );
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                    IconButton(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileView()),
                        );
                      },
                      icon: const Icon(Icons.person_rounded),
                      color: Color.fromARGB(255, 224, 224, 224),
                    ),
                  ],
                ),
              ),
              body: Scaffold(
                backgroundColor: const Color.fromARGB(255, 18, 18, 18),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GNav(
                    gap: 15,
                    tabBackgroundColor: const Color.fromARGB(255, 58, 52, 62),
                    padding: EdgeInsets.all(18),
                    tabs: [
                      GButton(
                        icon: Icons.monetization_on,
                        text: 'Dashboard',
                        textColor: Color.fromARGB(255, 224, 224, 224),
                        iconActiveColor: Color.fromARGB(255, 224, 224, 224),
                        iconColor: const Color.fromARGB(255, 121, 88, 115),
                      ),
                      GButton(
                        icon: Icons.bar_chart_sharp,
                        text: 'Stats',
                        textColor: Color.fromARGB(255, 224, 224, 224),
                        iconActiveColor: Color.fromARGB(255, 224, 224, 224),
                        iconColor: const Color.fromARGB(255, 121, 88, 115),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Stats_view()));
                        },
                      ),
                      GButton(
                        icon: Icons.account_balance_wallet_rounded,
                        text: 'Account',
                        textColor: Color.fromARGB(255, 224, 224, 224),
                        iconActiveColor: Color.fromARGB(255, 224, 224, 224),
                        iconColor: const Color.fromARGB(255, 121, 88, 115),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Account_view()));
                        },
                      )
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
                body: Container(
                  color: const Color.fromARGB(255, 18, 18, 18),
                  child: Stack(
                    children: [
                      ListView.builder(
                        itemCount: value.getallExpenseList().length,
                        itemBuilder: (context, index) => ListTile(
                          textColor: Colors.white,
                          title: Text(value.getallExpenseList()[index].Name),
                          subtitle: Text(value
                                  .getallExpenseList()[index]
                                  .dateTime
                                  .day
                                  .toString() +
                              ' / ' +
                              value
                                  .getallExpenseList()[index]
                                  .dateTime
                                  .month
                                  .toString() +
                              ' / ' +
                              value
                                  .getallExpenseList()[index]
                                  .dateTime
                                  .year
                                  .toString()),
                          trailing:
                              Text(value.getallExpenseList()[index].Ammount),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            width: 60.0,
                            height: 60.0,
                            child: ElevatedButton(
                              style: (ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 121, 88, 115),
                                foregroundColor:
                                    Color.fromARGB(255, 254, 254, 254),
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                              )),
                              onPressed: addNewExpense,
                              child: Icon(
                                Icons.add,
                                color: Color.fromARGB(255, 254, 254, 254),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
