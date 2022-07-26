import 'package:bloodbankOmar/Viwes/Screens/Healthy_News.dart';
import 'package:bloodbankOmar/Viwes/Screens/User_Screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Covid-19 Testing.dart';

class DrawerBody extends StatelessWidget {
final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Colors.red[100],
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () { Navigator.pushNamed(context, HealthyNews.route);},
              child: Row(
                children: [
                  Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.lightGreen,
                    size: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Health News",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Covid19Testing.route);
              },
              child: Row(children: [
                Icon(
                  Icons.coronavirus_outlined,
                  color: Colors.lightGreen,
                  size: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Text("Covid-19 Test " ,  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800]),)
              ]),
            ),
        SizedBox(
        height: 20,
      ),
      InkWell(
        onTap: () {
          _auth.signOut();
          Navigator.pushNamed(context, UserScreen.route);
          //Navigator.pop(context);
        },
        child: Row(children: [
          Icon(
            Icons.logout_rounded,
            color: Colors.lightGreen,
            size: 40,
          ),
          SizedBox(
            width: 20,
          ),
          Text("LogOut" ,  style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green[800]),)
        ]),
      ),
      SizedBox(
              height: 150,
            ),
            Image.asset(
              "Assent/Image/covid-test.png",
            )
            ],
        ),
      ),
    );
  }
}
