import 'package:pract/daily.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:pract/daily.dart';

class monthly extends StatelessWidget {
  var yearFromyearly;
  monthly(this.yearFromyearly);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'empresa - $yearFromyearly',
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SizedBox(height: 80,),
                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'JAN',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return daily(yearFromyearly,1);
                     },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40,),

                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'FEB',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return daily(yearFromyearly,2);
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40,),

                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'MAR',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return daily(yearFromyearly,3);
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40,),

                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'APR',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return daily(yearFromyearly,4);
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40,),

                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'MAY',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return daily(yearFromyearly,5);
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40,),

                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'JUN',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return daily(yearFromyearly,6);
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40,),

                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'JUL',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return daily(yearFromyearly,7);
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40,),

                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'AUG',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return daily(yearFromyearly,8);
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40,),

                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'SEP',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return daily(yearFromyearly,9);
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40,),

                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'OCT',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return daily(yearFromyearly,10);
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40,),

                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'NOV',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return daily(yearFromyearly,11);
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 40,),

                  ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'DEC',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return daily(yearFromyearly,12);
                          },
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 80,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
