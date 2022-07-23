import 'package:bloodbankOmar/Controller/ApiLogin.dart';
import 'package:bloodbankOmar/Viwes/Widgets/My_Buttom.dart';
import 'package:flutter/material.dart';
import 'Profile.dart';
import 'Request.dart';

class BodyDrawerHospital extends StatefulWidget {
  const BodyDrawerHospital({Key? key}) : super(key: key);
  static const String route = "BodyDrawerHospital";

  @override
  State<BodyDrawerHospital> createState() => _BodyDrawerHospitalState();
}

class _BodyDrawerHospitalState extends State<BodyDrawerHospital> {
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
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return RequestBloodScreen();
                }));
              },
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    backgroundImage: AssetImage(
                        "Assent/Image/request.png"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Requests",
                    style: TextStyle(
                        fontSize: 24,
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
              onTap: () async {
                Logout(context);
                await SQL.Insert(
                    '''INSERT INTO blood ('a+' , 'b+' , 'ab+' , 'o+' , 'o-' , 'ab-' , 'a-' , 'b-')
            VALUES("${null}" , "${null}" , "${null}" , "${null}","${null}","${null}","${null}" ,"${null}")  ''');
              },
              child: Row(children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage(
                      "Assent/Image/inside-logout-icon.png"),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "LogOut",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800]),
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),

            InkWell(
              onTap: () {
                getProfile();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return profile();
                }));
              },
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    backgroundImage: AssetImage("Assent/Image/pro.jpg"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[800]),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
