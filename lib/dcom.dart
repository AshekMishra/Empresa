import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pract/db.dart';
import 'package:intl/intl.dart';

class dcom extends StatefulWidget {
  @override
  State<dcom> createState() => _dcomState();
}

class _dcomState extends State<dcom> {
  @override
  var list;
  String s = 'show';
  bool show = false;
  String _day = '';
  String _month = '';
  String _year = '';
  var profit=0;

  Future<List<Map<String, Object?>>> getOne(
      var day, var month, var year) async {
    list = await regDatabase.instance
        .readsp(day as int, month as int, year as int);
    return list;
  }

  TextEditingController dateinput = TextEditingController();

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
            children: [
              SizedBox(
                height: 200,
              ),
              show
                  ? FutureBuilder(
                      future: getOne(
                          int.parse(_day), int.parse(_month), int.parse(_year)),
                      //future: getOne(int.parse(dayno.text),int.parse(monthno.text),int.parse(yearno.text)),
                      builder: (context, snapshot) {

                        if (list.length==0)
                          profit=0;
                        else
                          profit= list[0]['sale']-list[0]['expense'];
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                  "₹ $profit earned on this day"));
                        }
                      })
                  : SizedBox(),
              SizedBox(
                height: 100,
              ),
              Center(
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: dateinput,
                    decoration: InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: 'Enter Date',
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        print(formattedDate);
                        setState(() {
                          dateinput.text = formattedDate;
                          //controller has formatted date now
                          print(dateinput.text);
                          _day = formattedDate.substring(0, 2);
                          _month = formattedDate.substring(3, 5);
                          _year = formattedDate.substring(6, 10);
                          print(int.parse(_day));
                          print(int.parse(_month));
                          print(int.parse(_year));
                        });
                      } else {
                        print('date not picked');
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              ElevatedButton(
                style:
                ElevatedButton.styleFrom(padding: const EdgeInsets.all(10)),

                onPressed: () {
                  getOne(int.parse(_day), int.parse(_month), int.parse(_year));
                  // if (list.length==0)
                  //   profit=0;
                  // else
                  //   profit= list[0]['sale']-list[0]['expense'];
                  show = !show;
                  if (show == true) {
                    s = 'hide';
                  } else {
                    s = 'show';
                  }
                  Future.delayed(const Duration(milliseconds: 200),(){
                    setState(() {

                    });
                  });
                },
                child: Text(
                '$s',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
