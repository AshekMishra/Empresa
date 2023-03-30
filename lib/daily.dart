import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pract/db.dart';

class daily extends StatefulWidget {
  var yearFrommonthly;
  var monthFrommonthly;

  daily(this.yearFrommonthly, this.monthFrommonthly);

  @override
  State<daily> createState() => _dailyState();
}

class _dailyState extends State<daily> {
  var daysale = TextEditingController();

  var dayexpense = TextEditingController();

  var daynumber = TextEditingController();

  var list;
  // var selectOne;

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    // insert();
    //  getAll();
    // total=0;
    list = getOne();
  }

  Future insert() async {
    await regDatabase.instance.insertReg(
        int.parse(daynumber.text),
        widget.monthFrommonthly,
        widget.yearFrommonthly,
        int.parse(daysale.text),
        int.parse(dayexpense.text));
  }

  Future<String?> getAll() async {
    await regDatabase.instance.readReg();
  }

  // var total=0;

  Future<List<Map<String, Object?>>> getOne() async {
    list = await regDatabase.instance
        .readOne(widget.monthFrommonthly, widget.yearFrommonthly);

    return list;
  }

  Future del(int day) async{
    await regDatabase.instance.deleteReg(widget.monthFrommonthly, widget.yearFrommonthly, day);
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'empresa - ${widget.monthFrommonthly}/${widget.yearFrommonthly}',
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
                height: 20,
              ),

              FutureBuilder(
                  future: getOne(),
                  builder: (context, snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {

                      return Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            children: [
                              for (var i = 0; i < list.length; i++) ...[
                                SingleChildScrollView(
                                  child: Row(
                                    children: [
                                      // SizedBox(width: 13,),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text("${list[i]}"),
                                      ),
                                      SizedBox(width: 5,),
                                      ElevatedButton(onPressed: (){
                                          del(list[i]["day"]);
                                          // total=total-(list[i]['sale']-list[i]['expense']) as int;
                                          setState(() {

                                          });
                                      },
                                          child: Text('-'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ],
                          ),
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: daysale,
                  //enabled: flag,
                  decoration: InputDecoration(
                    hintText: 'Sale  (in ₹)',
                    // hintText: '$list'
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
              SizedBox(
                height: 15,
              ),
              Container(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: daynumber,
                  //enabled: flag,
                  decoration: InputDecoration(
                    hintText: 'Day Number (ex. 21)',
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
              SizedBox(
                height: 15,
              ),
              Container(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: dayexpense,
                  //enabled: flag,
                  decoration: InputDecoration(
                    hintText: 'expense',
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
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(padding: const EdgeInsets.all(10)),
                child: Text(
                  'Add + ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  insert();
                  // total+= int.parse(daysale.text)-int.parse(dayexpense.text);
                  // getAll();
                  // getOne();
                  setState(() {});
                },
              ),

              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
