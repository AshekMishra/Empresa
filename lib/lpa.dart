import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pract/db.dart';

class lpa extends StatefulWidget {
  @override
  State<lpa> createState() => _lpaState();
}

class _lpaState extends State<lpa> {
  @override
var list;
  var profit;
  String s='calculate';
  bool show = false;

  var year=TextEditingController();

  Future<List<Map<String, Object?>>> getByYear(var year) async {
    list = await regDatabase.instance
        .readByYear(year as int);
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            show?
            FutureBuilder(
                future: getByYear(int.parse(year.text)),
                builder: (context, snapshot) {
                  var total=0;
                  if (list.length==0)
                    total=0;
                  else
                    {
                      for (int i=0;i<list.length;i++)
                        {
                          total+= (list[i]['sale']-list[i]['expense']) as int;
                        }
                    }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {

                    return ElevatedButton(onPressed:(){

                    } , child: Text("₹ $total earned"));

                  }
                })



                :  SizedBox(),

            Container(
              width: 300,
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: year,
                //enabled: flag,
                decoration: InputDecoration(
                  hintText: 'Year Here',
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

            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '$s',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 35,
                  ),
                ),
              ),
              onPressed: () {
                show = !show;

                getByYear(int.parse(year.text));

                if (show == true)
                  s= 'refresh';
                else
                  s= 'calculate';
                Future.delayed(const Duration(milliseconds: 200),(){
                  setState(() {

                  });
                });

                    },
                  ),
          ],
        ),


      ),
    );
  }
}
