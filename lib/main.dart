import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloodbankOmar/Viwes/Screens/Healthy_News.dart';
import 'package:bloodbankOmar/Viwes/Screens/User_Sign_Up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Controller/Sqflite.dart';
import 'Viwes/Screens/Blood_Test.dart';
import 'Viwes/Screens/Body_Drawer_Hospital.dart';
import 'Viwes/Screens/Covid-19 Testing.dart';

import 'Viwes/Screens/Donor_Data_Screen.dart';
import 'Viwes/Screens/Edit_Data_Screen.dart';
import 'Viwes/Screens/Hospital_Screen.dart';
import 'Viwes/Screens/Hospital_details_Screen.dart';

import 'Viwes/Screens/User_Screen.dart';
import 'Viwes/Screens/User_Sign_In_Screen.dart';
import 'package:lottie/lottie.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  runApp(BloodBank());
}

class BloodBank extends StatefulWidget {
  @override
  State<BloodBank> createState() => _BloodBankState();
}

class _BloodBankState extends State<BloodBank> with TickerProviderStateMixin {
  SQFLITE SQL = SQFLITE();
  List Notes = [];

  readdata() async {
    var rsponse = await SQL.Select("SELECT * FROM 'Todo'");
    if (this.mounted) {
      setState(() {});
    }
    Notes.addAll(rsponse);
    return rsponse;
  }

  @override
  void initState() {
    readdata();
    super.initState();
  }

  late final controller =
      AnimationController(duration: const Duration(seconds: 1), vsync: this)
        ..repeat(reverse: true);

  late final Animation<double> animation =
      CurvedAnimation(parent: controller, curve: Curves.easeInCirc);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Blood Bank",
      home: Scaffold(
          backgroundColor: Colors.black,
          body: AnimatedSplashScreen(
              duration: 3000,
              backgroundColor: Colors.white,
              splashIconSize: 500,
              splash: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 350,
                      child: Lottie.asset(
                          'Assent/Image/16535-medical-transfusion-bag-loading.json',
                          fit: BoxFit.cover),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FadeTransition(
                      opacity: animation,
                      child: Text(
                        "Blood Life",
                        style: TextStyle(fontSize: 28, color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
              nextScreen: UserScreen())),
      //initialRoute: _auth.currentUser != null ?DonorDataScreen.route:UserScreen.route,
      routes: {
        "UserScreen": (context) => UserScreen(),
        "UserSignInScreen": (context) => UserSignInScreen(),
        "UserSignUpScreen": (context) => UserSignUpScreen(),
        "HealthyNews": (context) => HealthyNews(),
        "Covid19Testing": (context) => Covid19Testing(),
        "DonorDataScreen": (context) => DonorDataScreen(),
        "HospitalScreen": (context) => HospitalScreen(),
        "BodyDrawerHospital": (context) => BodyDrawerHospital(),
        "HospitalDetailsScreen": (context) => HospitalDetailsScreen(),
        "BloodTest": (context) => BloodTest(),
        "EditDataScreen": (context) => EditDataScreen(),
      },
    );
  }
}
