import 'package:flutter/material.dart';
import 'package:speend/views/setting_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Recover Account"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Settings"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              print("Recover Account");
            } else if (value == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (content) => const SettingView()),
              );
            }
          }),
        ],
      ),
    );
  }
}
