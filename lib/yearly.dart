// import 'package:empresa2/monthly.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pract/monthly.dart';

class yearly extends StatefulWidget {
  @override
  State<yearly> createState() => _yearlyState();
}

class _yearlyState extends State<yearly> {
  int year = 2023;
  bool show = false;
  int yearCount = 2023;
  @override
  Widget build(BuildContext context) {
    //List<Widget> myWidgets = [];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'empresa',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 30,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfffbb034),
              Color(0xfff9d976),
            ],
            begin: FractionalOffset(0.0, 1.0),
            end: FractionalOffset(1.0, 0.0),
          ),
        ),

        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),
                  // show ?

                  //myWidgets
                  for (int i = year; i <= yearCount; i++) ...[
                    SingleChildScrollView(
                      child: Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                            ElevatedButton(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '$i',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 35,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return monthly(i);
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],

                  // ElevatedButton(
                  //         onPressed: () {},
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8.0),
                  //           child: Text(
                  //             '$yearCount',
                  //             style: TextStyle(
                  //               fontWeight: FontWeight.w700,
                  //               fontSize: 35,
                  //             ),
                  //           ),
                  //         ),
                  //       )
                  //     : SizedBox(),

                  SizedBox(
                    height: 40,
                  ),

                  Container(
                    width: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        //logic here
                        //show = true;
                        setState(() {
                          yearCount++;
                        });
                      },
                      child: Center(child: Text('+')),
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Container(
                    width: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        //logic here
                        //show = true;
                        setState(() {
                          yearCount--;
                          if (yearCount < 2022) yearCount = 2022;
                        });
                      },
                      child: Center(child: Text('-')),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  //next child
                ],
              ),
            ),
          ),
        ),

        // child here
      ),
    );
  }
}
