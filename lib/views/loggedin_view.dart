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
      actions: [
        PopupMenuButton(itemBuilder: (context) {
          return [
            const PopupMenuItem<int>(
              value: 0,
              child: Text("Setting"),
            ),
            const PopupMenuItem<int>(value: 1, child: Text('Logout'))
          ];
        }, onSelected: (value) {
          if (value == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingView()));
          }
          if (value == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginView()));
          }
        }),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileView()),
              );
            },
            icon: const Icon(Icons.person_rounded),
          )
        ],
      ),
    ));
  }
}
