import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:speend/views/loggedin_view.dart';
import 'package:speend/views/login_view.dart';
import 'package:speend/views/profile_view.dart';
import 'package:speend/views/setting_view.dart';
import 'package:speend/views/stats_view.dart';

class Account_view extends StatefulWidget {
  const Account_view({super.key});

  @override
  State<Account_view> createState() => _Account_viewState();
}

class _Account_viewState extends State<Account_view> {
  int _selectedIndex = 2;
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
                  MaterialPageRoute(builder: (context) => const LoggedinView()),
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
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoggedinView()));
                },
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 175,
                  width: 400,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 121, 88, 115),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Accounts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Color.fromARGB(255, 254, 254, 254),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
