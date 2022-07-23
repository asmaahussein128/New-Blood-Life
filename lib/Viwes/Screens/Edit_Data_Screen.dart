import 'package:bloodbankOmar/Controller/ApiLogin.dart';
import 'package:bloodbankOmar/Controller/Sqflite.dart';
import 'package:bloodbankOmar/Viwes/Screens/Test_______Blood.dart';
import 'package:bloodbankOmar/Viwes/Widgets/Row_Type.dart';
import 'package:bloodbankOmar/Viwes/Widgets/User_Buttomm.dart';
import 'package:flutter/material.dart';

class EditDataScreen extends StatefulWidget {
  static const String route = "EditDataScreen";
  var A=" ";
   var B=" ";
   var AB=" ";
   var O=" ";
 var AN=" ";
   var BN=" ";
   var ABN=" ";
   var ON=" ";
  @override
  _EditDataScreenState createState() => _EditDataScreenState();
}

class _EditDataScreenState extends State<EditDataScreen> {

  SQFLITE SQL = SQFLITE();
  late List data;

  readdata() async {
    var rsponse = await SQL.Select("SELECT * FROM 'blood'");
    if (mounted) {
      setState(() {});
    }
    data.addAll(rsponse);
    return rsponse;
  }

  @override
  void initState() {
    readdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height:170,
              width: 50,
              child: FutureBuilder(
                future: getProfile(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return (snapshot.hasData)
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                height: 120,
                                width: 50,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                            "${snapshot.data["name"]}",
                                            //UserSignUpScreen.nameH,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.red[700],
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

                                          Text(
                                            "${snapshot.data["phone"]}"
                                          ,
                                            style: TextStyle(
                                                fontSize: 25,
                                                color: Colors.red[700],
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.red)));
                          },
                        )
                      : Center(
                          child: Text(
                          "Loading.......",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ));
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red)),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Rowtype(
                      bloodtype: "A+",
                      asmaa: (value) {
                        setState(() {
                    widget.A=value;
                          print("Value A+ : ${widget.A}");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.A == " " ? "" : "${widget.A}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                      bloodtype: "B+",
                      asmaa: (value) {
                        setState(() {
                        widget.B = value;
                          print("Value B+ : ${widget.B}");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.B == " " ? "" : "${widget.B}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                      bloodtype: "AB+",
                      asmaa: (value) {
                        setState(() {
                         widget. AB = value;
                          print("Value AB+ : ${widget.AB}");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                       widget. AB == " " ? "" : "${widget.AB}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                      bloodtype: "O+",
                      asmaa: (value) {
                        setState(() {
                          widget.O = value;
                          print("Value O+ : ${widget.O}");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                       widget.O == " " ? "" : "${widget.O}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                      bloodtype: "A-",
                      asmaa: (value) {
                        setState(() {
                          widget.AN = value;
                          print("Value A- : ${widget.AN}");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                       widget. AN == "  " ? "" : "${widget.AN}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                    bloodtype: "B-",
                    asmaa: (value) {
                      setState(() {
                        widget.BN = value;
                        print("Value B- : ${widget.BN}");
                      });
                    },
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.BN == " " ? "" : "${widget.BN}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                      bloodtype: "O-",
                      asmaa: (value) {
                        setState(() {
                          widget.ON = value;
                          print("Value O- : ${widget.ON}");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.ON == " " ? "" : "${widget.ON}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                  ),
                  Rowtype(
                      bloodtype: "AB-",
                      asmaa: (value) {
                        setState(() {
                          widget.ABN = value;
                          print("Value AB- : ${widget.ABN}");
                        });
                      }),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.ABN == " " ? "" : "${widget.ABN}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.red),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                UserButtom(
                    asmaa: ()async {
                      await SQL.Insert(
                          '''INSERT INTO blood ('a+' , 'b+' , 'ab+' , 'o+' , 'o-' , 'ab-' , 'a-' , 'b-')
            VALUES("${widget.A}" , "${widget.B}" , "${widget.AB}" , "${widget.O}","${widget.ON}","${widget.ABN}","${widget.AN}" ,"${widget.BN}")  ''');

                      final snackBar = SnackBar(
                          backgroundColor: Colors.black,
                          content: Text("Saved Data..."));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    namebutton: Text("Save Data",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    colorbutton: Colors.red[700]),
                MaterialButton(
                  height: 45,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: ()  {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return Result();
                        }));
                  },
                  child: Text("Show Data",style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
                  color: Colors.red[700],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}