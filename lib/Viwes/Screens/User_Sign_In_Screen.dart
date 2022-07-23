import 'package:bloodbankOmar/Controller/ApiLogin.dart';
import 'package:bloodbankOmar/Viwes/Widgets/Text_Filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Conests.dart';
import 'Donor_Data_Screen.dart';

class UserSignInScreen extends StatefulWidget {
  static const String route = "UserSignInScreen";
  var password;

  var email;

  @override
  _UserSignInScreenState createState() => _UserSignInScreenState();
}

class _UserSignInScreenState extends State<UserSignInScreen> {
  String email = "";
  String password = "";
  String name = "";
  String phone = "";

  @override
  void initState() {
    ReadP(context);
    super.initState();
  }

  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          key: scaffoldkey,
          backgroundColor: Colors.red[100],
          body: Container(
            child: Stack(
              children: [
                Container(
                  height: 400,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          "Assent/Image/ff.jfif",
                          height: 400,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 400,
                        padding: EdgeInsets.all(10),
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.red.withOpacity(0.4),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Welcome to",
                                  style: TextStyle(
                                    fontSize: 25,
                                    letterSpacing: 2,
                                    color: Colors.yellow[700],
                                  ),
                                  children: [
                                    TextSpan(
                                      text: " Blood Life,",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow[700],
                                      ),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Signin to Continue",
                              style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250, left: 25, right: 25),
                  child: Container(
                    height: 340,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 15),
                            blurRadius: 25,
                            color: Colors.red)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Form(
                      key: formkey,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "SignIn",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.activeColor),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 3,
                                width: 70,
                                color: Colors.orange,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              buildTextField(Icons.email_outlined, "email",
                                  false, TextInputType.emailAddress, (value) {
                                if ((value.isEmpty) || (value.length < 6)) {
                                  return " the Email is required and letter >6 ..!";
                                } else {
                                  return null;
                                }
                              }, (value) {
                                email = value;
                                widget.email = value;
                              }),
                              buildTextField(Icons.lock_outline, "password",
                                  true, TextInputType.visiblePassword, (value) {
                                if (value.isEmpty) {
                                  return " the password is required and letters >6 ..!";
                                } else if (value.length < 6) {
                                  return "the password must be =< 6 value..!";
                                } else {
                                  return null;
                                }
                              }, (value) {
                                password = value;
                                widget.password = value;
                              }),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "SignIn As?", //textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Palette.activeColor),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (formkey.currentState!.validate()) {
                                          Login(email, password, context);
                                          //     scaffoldkey.currentState?.showSnackBar(
                                          //         SnackBar(
                                          //             content: Text(
                                          //                 "wait sing in now..! ")));
                                        }
                                        //
                                        print(email);
                                        print(password);
                                      });
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                            "Assent/Image/hossssss.png"),
                                        radius: 30),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (formkey.currentState!.validate()) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        try {
                                          var auth = FirebaseAuth.instance;
                                          UserCredential user = await auth
                                              .signInWithEmailAndPassword(
                                                  email: widget.email,
                                                  password: widget.password);
                                          print(user.user!.displayName);
                                          Navigator.of(
                                                  context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DonorDataScreen()),
                                                  (Route<dynamic> route) =>
                                                      false);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                              content: Text('success')));

                                        } on FirebaseAuthException catch (ex) {
                                          if (ex.code == 'weak password') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'the password provided is too weak')));
                                          } else if (ex.code ==
                                              'email-already-in-use') {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        'This email already in use')));
                                          }
                                        }

                                        setState(() {
                                          isLoading = false;
                                        });
                                      }
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                            "Assent/Image/person.png"),
                                        radius: 30),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
