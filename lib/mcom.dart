import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pract/db.dart';


class mcom extends StatefulWidget {
  @override
  State<mcom> createState() => _mcomState();
}

class _mcomState extends State<mcom> {
  bool show=false;
  var s= 'show';
  var yearno= TextEditingController();

  var monthno= TextEditingController();

  @override
  var list;

  Future<List<Map<String, Object?>>> getOne(var month, var year) async {
    list = await regDatabase.instance
        .readOne(month as int, year as int);
    return list;
  }

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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[

            SizedBox(height: 90,),

            show?
            FutureBuilder(
            future: getOne(int.parse(monthno.text),int.parse(yearno.text)),
            builder: (context, snapshot) {
              var total=0;
              for (int i=0;i<list.length;i++)
                total+=list[i]['sale'] as int;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {

                return ElevatedButton(onPressed:(){

                } , child: Text("₹ $total earned in this month"));

              }
            })



          :  SizedBox(),

          SizedBox(height: 150,),

          Container(
            width: 300,
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: yearno,
              //enabled: flag,
              decoration: InputDecoration(
                hintText: 'Year here',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(
                    color: Colors.yellowAccent,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(
                    color: Colors.yellowAccent,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: Colors.black45,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 50,),


          Container(
            width: 300,
            child: TextField(
              keyboardType: TextInputType.phone,
              controller: monthno,
              //enabled: flag,
              decoration: InputDecoration(
                hintText: 'Month here',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(
                    color: Colors.yellowAccent,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(
                    color: Colors.yellowAccent,
                    width: 2,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: Colors.black45,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 100),


          ElevatedButton(
            style:
            ElevatedButton.styleFrom(padding: const EdgeInsets.all(10)),
            child: Text(
              '$s',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),

            onPressed: () {
              getOne(int.parse(monthno.text),int.parse(yearno.text));
                show=!show;
                if (show == true)
                  s= 'hide';
                else
                  s='show';
                Future.delayed(const Duration(milliseconds: 200),(){
                setState(() {

                });
    });
            },
          ),


],
        ),
      ),

      ),
    );
  }
}
