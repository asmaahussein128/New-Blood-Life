import 'package:bloodbankOmar/Viwes/Widgets/Text_Filed_Test.dart';
import 'package:bloodbankOmar/Viwes/Widgets/User_Buttomm.dart';
import 'package:flutter/material.dart';
import '../../Controller/Sqflite.dart';
import 'Drawer_Body.dart';
import 'Hospital_details_Screen.dart';


class DonorDataScreen extends StatefulWidget {
  static const String route = "DonorDataScreen";


  @override
  _DonorDataScreenState createState() => _DonorDataScreenState();
}


class _DonorDataScreenState extends State<DonorDataScreen> {
   var age;
   var BB;
   var POrD;
   var Tf=true;
   SQFLITE SQL = SQFLITE();
   late List Userdata =[];
   readData() async {
     var rsponse = await SQL.Select("SELECT * FROM 'UserData'");
     if (mounted) {
       setState(() {});
     }
     Userdata.addAll(rsponse);
     return rsponse;
   }
   @override
   void initState() {
     readData();
     super.initState();
   }
   final formkey = GlobalKey<FormState>();
   final scaffoldkey = GlobalKey<ScaffoldState>();

   @override
  Widget build(BuildContext context) {
    return

       Scaffold(key: scaffoldkey,
          drawer: DrawerBody(),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(


                child:      Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child:Userdata.isEmpty?  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Name : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black),
                                ),
                                //SizedBox(width: 10,)
                                Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.red[800],
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Phone : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black),
                                ),
                                //SizedBox(width: 10,)
                                Text(
                                  ""
                                  ,style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.red[700],
                                    fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),   ],
                      ): Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Name : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black),
                                ),
                                //SizedBox(width: 10,)
                                Text(
                                  "${ Userdata.last['name']}",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.red[800],
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Phone : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.black),
                                ),
                                //SizedBox(width: 10,)
                                Text(
                                  "${Userdata.last['phone']}"
                                  ,style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.red[700],
                                    fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),   ],
                      )

                      ,height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red))),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: Form(key:formkey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Your Age : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.red[800]),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextFiledTest(Icons.add, "Age", false,
                                      TextInputType.number, (value) {
                                        setState(() {
                                          age=value;
                                          print("Your Age : $age");
                                        });
                                      },(value) {
                                      if (value.isEmpty) {
                                        return "required..!";
                                      } else {
                                        return null;
                                      }
                                    },)
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Your Blood Type : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.red[800]),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextFiledTest(Icons.add, "Blood", false,
                                      TextInputType.visiblePassword, (value) {
                                        setState(() {
                                          BB=value;
                                          print("YourBlood : $BB");
                                        });

                                      },(value) {
                                      if (value.isEmpty) {
                                        return "required..!";
                                      } else {
                                        return null;
                                      }
                                    },),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Patient&Donor : ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.red[800]),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TextFiledTest(Icons.add, "P&D", false,
                                      TextInputType.visiblePassword, (value) {
                                        setState(() {
                                          POrD=value;
                                          print("P&D : $POrD");
                                        });

                                      },(value) {
                                      if (value.isEmpty) {
                                        return "required..!";
                                      } else {
                                        return null;
                                      }
                                    },),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center
                                ,children: [
                                Tf==true?  UserButtom(
                                    asmaa: () async {if (formkey.currentState!.validate()){

await SQL.Insert(
        '''INSERT INTO User ('D%P' , 'age' , 'PType')
                                            VALUES("$POrD" , "$age" , "$BB" )  ''');
print("2222222");
                                    setState(() {
                                      Tf=false;
                                    });}
                                    print("444444");


                                    },
                                    namebutton: Text("Save Data",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    colorbutton: Colors.red[800]):
                                UserButtom(
                                    asmaa: () {
                                      Navigator.pushNamed(context, HospitalDetailsScreen.route);
                                      setState(() {
                                        Tf=true;
                                      });
                                    },
                                    namebutton: Text("Find Hospital",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    colorbutton: Colors.red[800])
                              ],),
                            ) ],
                        ),
                      ),
                      height: 400,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.red))),
                  SizedBox(
                    height:10,
                  ),

                ],
              )
            ),
          ),
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back))
            ],
            title: Text("Donor Or patient"),
            centerTitle: true,
            backgroundColor: Colors.red[800],
          ),
        );
  }
}
