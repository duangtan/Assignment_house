import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class house extends StatefulWidget {
  const house({super.key});

  @override
  State<house> createState() => _houseState();
}

class _houseState extends State<house> {
  final N = TextEditingController();
  final name = TextEditingController();
  int? house1;
  int? house2;
  int? house3;
  int? house4;
  int? remain1;
  int? remain2;
  int? remain3;
  int? remain4;

  List<String> nameIntara = [];
  List<String> namePracha = [];
  List<String> nameKanonk = [];
  List<String> nameBura = [];

  void handleGet(){
    int? totalPeople = int.tryParse(N.text);
    List<int> houses = List<int>.filled(4, 0);
    int houseIndex = 0;
    if (totalPeople != null) {
      while (totalPeople! > 0) {
        houses[houseIndex]++;
        totalPeople--;
        houseIndex = (houseIndex + 1) % 4;
      }
      setState(() {
        house1 =houses[0];
        house2 =houses[1];
        house3 =houses[2];
        house4 =houses[3];
        remain1 =houses[0];
        remain2 =houses[1];
        remain3 =houses[2];
        remain4 =houses[3];
        N.text ="";
        nameIntara = [];
        namePracha = [];
        nameKanonk = [];
        nameBura = [];
      });

    } else {
      print("The input is not a valid number.");
    }

  }
  void addnameIntara(String name) {
    nameIntara.add(name);
  }
  void addnamePracha(String name) {
    namePracha.add(name);
  }
  void addnameKanonk(String name) {
    nameKanonk.add(name);
  }
  void addnameBura(String name) {
    nameBura.add(name);
  }
  void _showTextFormFieldDialog1(BuildContext context) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
          title: Text("กรุณาใส่ชื่อของท่าน"),
          content: TextFormField(
            controller: name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onFieldSubmitted: (value) {
              addnameIntara(value);
              name.clear();
            },
          ),

          actions: <Widget>[
            ElevatedButton(
              child: Text("สมัครเข้าสถาบัน"),
              onPressed: () {
                addnameIntara(name.text);
                name.clear();
                setState(() {
                  remain1 = remain1! -1;
                  print(remain1);
                });
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("ยกเลิก"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showTextFormFieldDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("กรุณาใส่ชื่อของท่าน"),
          content: TextFormField(
            controller: name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onFieldSubmitted: (value) {
              addnamePracha(value);
              name.clear();
            },
          ),

          actions: <Widget>[
            ElevatedButton(
              child: Text("สมัครเข้าสถาบัน"),
              onPressed: () {
                addnamePracha(name.text);
                name.clear();
                setState(() {
                  remain2 = remain2! -1;
                  print(remain2);
                });
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("ยกเลิก"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showTextFormFieldDialog3(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("กรุณาใส่ชื่อของท่าน"),
          content: TextFormField(
            controller: name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onFieldSubmitted: (value) {
              addnameKanonk(value);
              name.clear();
            },
          ),

          actions: <Widget>[
            ElevatedButton(
              child: Text("สมัครเข้าสถาบัน"),
              onPressed: () {
                addnameKanonk(name.text);
                name.clear();
                setState(() {
                  remain3 = remain3! -1;
                  print(remain3);
                });
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("ยกเลิก"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showTextFormFieldDialog4(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("กรุณาใส่ชื่อของท่าน"),
          content: TextFormField(
            controller: name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            onFieldSubmitted: (value) {
              addnameBura(value);
              name.clear();
            },
          ),

          actions: <Widget>[
            ElevatedButton(
              child: Text("สมัครเข้าสถาบัน"),
              onPressed: () {
                addnameBura(name.text);
                name.clear();
                setState(() {
                  remain4 = remain4! -1;
                  print(remain4);
                });
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("ยกเลิก"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showFullDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("สถาบันนี้เต็มแล้ว",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold)),
          actions: <Widget>[
            ElevatedButton(
              child: Text("เลือกสถาบันใหม่",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.black)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showListName(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (nameIntara.isNotEmpty) ...[
                SizedBox(height: 20,),
                Text("รายชื่อสมาชิกสถาบันอินทร",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,)),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(), // ปิดการใช้งานการเลื่อนของ ListView.builder
                  shrinkWrap: true, // ทำให้ ListView ปรับขนาดตามเนื้อหา
                  itemCount: nameIntara.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(nameIntara[index]),
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
              if (namePracha.isNotEmpty) ...[
                Text("รายชื่อสมาชิกสถาบันประชาชื่น",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,)),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: namePracha.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(namePracha[index]),
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
              if (nameKanonk.isNotEmpty) ...[
                Text("รายชื่อสมาชิกสถาบันกนกอาชีวะ",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,)),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: nameKanonk.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(nameKanonk[index]),
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
              if (nameBura.isNotEmpty) ...[
                Text("รายชื่อสมาชิกสถาบันบูรณพล",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,)),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: nameBura.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(nameBura[index]),
                    );
                  },
                ),
                SizedBox(height: 20),
              ],
              ElevatedButton(
                child: Text('ปิด',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.black)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/4kingslogo.png',height: 40,),
            Text('4 KING')
          ],
        )
    ),
    body: Column(
      children: [
      Center(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(3.0),
          decoration: BoxDecoration(
            //border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Color(0xFFA00000),),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 10,height: 50,),
                  Text('รับน้องใหม่เข้าสถาบัน',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.white)),
                  Image.asset('assets/images/1.png',height: 50,)
                ],
              ),
              Row(children: [SizedBox(width: 10,),Text('โดยผู้สมัครต้องแย่งชิงกันเข้าสถาบันที่ต้องการ',style: TextStyle(color: Colors.white))],)
            ],
          ),
        ),
      ),

        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('จำนวนคนที่รับ '),
              ElevatedButton(
                  onPressed: () => _showListName(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black// เปลี่ยนสีพื้นหลังของปุ่มเป็นสีแดง
                  ),
                  child: Text('ตรวจสอบรายชื่อ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white))
                  ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: N,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: handleGet,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFA00000),
              ),
              child: const Text(
                'รับ',
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),
              ),

            ),
            SizedBox(width: 30,),
          ],
        ),

        SizedBox(height: 10,),
        Text('สถาบัน',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),
        SizedBox(height: 15,),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //1
              Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    color: Color(0xFFA00000),
                    child: Center(child:
                    Image.asset('assets/images/2.png',width: 100,)),
                  ),
                  Text('อินทร',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Row(children: [Icon(Icons.people),SizedBox(width: 10,),Text("$remain1 / $house1 คน")],),
                      IconButton(
                        icon: Icon(Icons.add_home_work),
                        onPressed: () {
                          if(remain1!>0){
                            _showTextFormFieldDialog1(context);
                          }else{
                            _showFullDialog(context);
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
              //2
              Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    color: Color(0xFFA00000),
                    child: Center(child:
                    Image.asset('assets/images/3.png',width: 100,)),
                  ),
                  Text('ประชาชื่น',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Row(children: [Icon(Icons.people),SizedBox(width: 10,),Text("$remain2 / $house2 คน")],),
                      IconButton(
                        icon: Icon(Icons.add_home_work),
                        onPressed: () {
                          if(remain2!>0){
                            _showTextFormFieldDialog2(context);
                          }else{
                            _showFullDialog(context);
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        SizedBox(height: 20), // Provide some spacing between the rows
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //3
              Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    color: Color(0xFFA00000),
                    child: Center(child:
                    Image.asset('assets/images/4.png',width: 100,)),
                  ),
                  Text('กนกอาชีวะ',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Row(children: [Icon(Icons.people),SizedBox(width: 10,),Text("$remain3 / $house3 คน")],),
                      IconButton(
                        icon: Icon(Icons.add_home_work),
                        onPressed: () {
                          if(remain3!>0){
                            _showTextFormFieldDialog3(context);
                          }else{
                            _showFullDialog(context);
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
              //4
              Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    color: Color(0xFFA00000),
                    child: Center(child:
                    Image.asset('assets/images/5.png',width: 100,)),
                  ),
                  Text('บูรณพล',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Row(children: [Icon(Icons.people),SizedBox(width: 10,),Text("$remain4 / $house4 คน")],),
                      IconButton(
                        icon: Icon(Icons.add_home_work),
                        onPressed: () {
                          if(remain4!>0){
                            _showTextFormFieldDialog4(context);
                          }else{
                            _showFullDialog(context);
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),

        SizedBox(height: 20),
      ],

    ),
    );
  }
}
