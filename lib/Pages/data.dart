import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Datapage extends StatefulWidget {
  const Datapage({super.key});

  @override
  State<Datapage> createState() => _DatapageState();
}

class _DatapageState extends State<Datapage> {
  bool _Gate01 = false;
  bool _GateEmergency01 = false;
  Query drefgate01 =
      FirebaseDatabase.instance.ref().child('Data').child('Gate 01');
  DatabaseReference referencegate =
      FirebaseDatabase.instance.ref().child('Data').child('Gate 01');

  Query drefspeed =
      FirebaseDatabase.instance.ref().child('Data').child('speed');
  DatabaseReference referencespeed =
      FirebaseDatabase.instance.ref().child('Data').child('speed');

  Query drefgate02 =
      FirebaseDatabase.instance.ref().child('Data').child('Emergency Gate 01');
  DatabaseReference referencegate02 =
      FirebaseDatabase.instance.ref().child('Data').child('Emergency Gate 01');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Card(
                      shadowColor: Colors.black,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        height: 230,
                        width: 330,
                        child: Lottie.asset('assets/animation/metro.json'),
                      ),
                    ),
                  ),
                  FirebaseAnimatedList(
                    query: drefgate01,
                    shrinkWrap: true,
                    itemBuilder: ((BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.green,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 60,
                                  ),
                                  Text(
                                    'Gate Status',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Container(
                                          child: Text(
                                            snapshot.value.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  FirebaseAnimatedList(
                    query: drefgate02,
                    shrinkWrap: true,
                    itemBuilder: ((BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.green,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 60,
                                  ),
                                  Text(
                                    'Emergency Gate',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 14,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Container(
                                          child: Text(
                                            snapshot.value.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                  FirebaseAnimatedList(
                    query: drefspeed,
                    shrinkWrap: true,
                    itemBuilder: ((BuildContext context, DataSnapshot snapshot,
                        Animation<double> animation, int index) {
                      return Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.green,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 60,
                                  ),
                                  Text(
                                    'Speed',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Container(
                                          child: Text(
                                            snapshot.value.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
