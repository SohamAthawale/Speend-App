import 'package:flutter/material.dart';
import 'package:speend/views/login_view.dart';
import 'package:speend/views/profile_view.dart';
import 'package:speend/views/setting_view.dart';

class LoggedinView extends StatefulWidget {
  const LoggedinView({super.key});

  @override
  State<LoggedinView> createState() => _LoggedinViewState();
}

class _LoggedinViewState extends State<LoggedinView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const PopupMenuItem<int>(value: 1, child: Text('Logout'))
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
                  MaterialPageRoute(builder: (context) => const LoginView()),
                );
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfileView()),
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
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 18, 18, 18),
            selectedItemColor: Color.fromARGB(255, 224, 224, 224),
            unselectedItemColor: const Color.fromARGB(255, 121, 88, 115),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money_sharp),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_sharp),
                label: 'Statistics',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet_rounded),
                  label: 'Accounts'),
            ]),
        body: Container(
          alignment: Alignment.bottomRight,
          color: const Color.fromARGB(255, 18, 18, 18),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 60.0,
              height: 60.0,
              child: ElevatedButton(
                style: (ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 121, 88, 115),
                  foregroundColor: Color.fromARGB(255, 254, 254, 254),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                )),
                onPressed: () async {},
                child: Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 254, 254, 254),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
