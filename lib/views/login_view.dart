import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:speend/views/loggedin_view.dart';
import 'package:speend/views/register_view.dart';
import '../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  int currentind = 0;
  int homepage() {
    currentind = 1;
    return 0;
  }

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
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
                    child: Text("Recover Account"),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  print("Recover Account");
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
                  MaterialPageRoute(builder: (context) => const RegisterView()),
                );
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            TextButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterView()));
              },
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 224, 224, 224))),
              child: const Text("Sign up"),
            )
          ],
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 18, 18, 18),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10.0, bottom: 30, left: 30, right: 30),
          child: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 200.0,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(),
                        height: 1000,
                        width: 400,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 100.0),
                          child: CarouselSlider(
                              carouselController: CarouselController(),
                              options: CarouselOptions(
                                viewportFraction: 1,
                                height: 1050,
                                aspectRatio: 16.9,
                                enableInfiniteScroll: true,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 2),
                                scrollDirection: Axis.horizontal,
                              ),
                              items: [
                                Container(
                                  margin: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://images.unsplash.com/photo-1686153490072-cc31c6bf3686?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://images.unsplash.com/photo-1685988755140-263e9d8b2fb1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1287&q=80'),
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://www.legacygeek.com/wp-content/uploads/2022/07/iPhone-14-Triangle-Wallpaper-576x1024.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 430,
                              bottom: 30,
                            ),
                            child: TextField(
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  height: 1.5,
                                  color: Colors.white),
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(255, 121, 88, 115),
                                filled: true,
                                hintText: 'Enter email',
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              autocorrect: false,
                              enableSuggestions: true,
                              keyboardType: TextInputType.emailAddress,
                              controller: _email,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: TextField(
                              style: const TextStyle(
                                  fontSize: 12.0,
                                  height: 1.5,
                                  color: Colors.white),
                              decoration: InputDecoration(
                                fillColor:
                                    const Color.fromARGB(255, 121, 88, 115),
                                filled: true,
                                hintText: 'Enter password',
                                hintStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              obscureText: true,
                              autocorrect: false,
                              enableSuggestions: false,
                              controller: _password,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final email = _email.text;
                              final password = _password.text;
                              try {
                                final userCredential = await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                                        email: email, password: password);

                                print(userCredential);
                                final user = FirebaseAuth.instance.currentUser;
                                if (user?.emailVerified ?? false) {
                                  print('User is verified');
                                } else {
                                  print('user is not verified');
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoggedinView()));
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'wrong-password') {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Stack(children: [
                                          AlertDialog.adaptive(
                                            title: Text('Wrong password'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('OK'))
                                            ],
                                          ),
                                        ]);
                                      });
                                  print('error');
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Stack(children: [
                                          AlertDialog.adaptive(
                                            title: Text('Wrong password'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('OK'))
                                            ],
                                          ),
                                        ]);
                                      });

                                  print('ERROR');
                                }
                              }
                            },
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 98, 77, 97))),
                            child: const Text("Login"),
                          ),
                        ],
                      ),
                    ),
                  ]);
                default:
                  return const Text("Loading");
              }
            },
          ),
        ),
      ),
    );
  }
}
