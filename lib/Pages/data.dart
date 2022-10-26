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
  bool _Gate02 = false;
  bool _GateEmergency01 = false;
  bool _GateEmergency02 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.all(10),
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
                        width: 140,
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
                                '255 km/hr',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
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
                        'Gate No. 1',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      CupertinoSwitch(
                          thumbColor: Colors.white,
                          trackColor: Color.fromARGB(255, 220, 255, 220),
                          activeColor: Color.fromARGB(255, 220, 255, 220),
                          value: _Gate01,
                          onChanged: (value) {
                            setState(() {
                              _Gate01 = value;
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
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
                        'Gate No. 2',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      CupertinoSwitch(
                          thumbColor: Colors.white,
                          trackColor: Color.fromARGB(255, 220, 255, 220),
                          activeColor: Color.fromARGB(255, 220, 255, 220),
                          value: _Gate02,
                          onChanged: (value) {
                            setState(() {
                              _Gate02 = value;
                            });
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  shadowColor: Colors.black,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.green,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 330,
                        height: 10,
                      ),
                      Text(
                        'Emergency Alarm',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 10,
                              ),
                              Text(
                                'Gate No. 1',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 150,
                              ),
                              CupertinoSwitch(
                                  thumbColor: Colors.white,
                                  trackColor:
                                      Color.fromARGB(255, 220, 255, 220),
                                  activeColor: Colors.red,
                                  value: _GateEmergency01,
                                  onChanged: (value) {
                                    setState(() {
                                      _GateEmergency01 = value;
                                    });
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 10,
                              ),
                              Text(
                                'Gate No. 2',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 150,
                              ),
                              CupertinoSwitch(
                                  thumbColor: Colors.white,
                                  trackColor:
                                      Color.fromARGB(255, 220, 255, 220),
                                  activeColor: Colors.red,
                                  value: _GateEmergency02,
                                  onChanged: (value) {
                                    setState(() {
                                      _GateEmergency02 = value;
                                    });
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
