import 'package:flutter/material.dart';
import 'package:pract/lpa.dart';
import 'package:pract/mcom.dart';
import 'package:pract/splash.dart';
import 'package:pract/yearly.dart';
import 'package:pract/dcom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Venture',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: splashscreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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

        //
        //
        //
        //
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'register',
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
                          return yearly();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),

                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'monthly fetcher',
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
                          return mcom();
                        },
                      ),
                    );
                  },
                ),

                SizedBox(height: 30,),

                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'daily fetcher',
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
                          return dcom();
                        },
                      ),
                    );
                  },
                ),

                SizedBox(height: 30,),

                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'lpa calculator',
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
                          return lpa();
                        },
                      ),
                    );
                  },
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
