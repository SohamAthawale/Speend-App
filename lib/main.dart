import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speend/data/expense_data.dart';
import 'package:speend/views/loggedin_view.dart';
import 'package:speend/views/register_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      routes: {
        '/loogedin': (context) => const LoggedinView(),
      },
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => open_View())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage('assets/images/Splashpage2.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}

class open_View extends StatefulWidget {
  const open_View({super.key});

  @override
  State<open_View> createState() => _open_ViewState();
}

class _open_ViewState extends State<open_View> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context, child) => Scaffold(
        backgroundColor: const Color.fromARGB(42, 0, 33, 248),
        body: Stack(
          children: [
            const FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: Image(
                image: AssetImage('assets/images/Splashpage.png'),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 30,
              left: 40,
              right: 40,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterView()));
                },
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 75, 66, 79))),
                child: const Text('Get Started'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
