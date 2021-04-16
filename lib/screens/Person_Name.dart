import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _firestore = Firestore.instance;

class Name_of_Person extends StatefulWidget {
  static const String id = 'Name_of_person';

  @override
  _Name_of_PersonState createState() => _Name_of_PersonState();
}

class _Name_of_PersonState extends State<Name_of_Person> {
  int num;
  String name = '';
  String tempdocID;

  // @override
  // void initState() {
  //   no_name();
  //   super.initState();
  // }
  //
  // void no_name() async {
  //   final x = await _firestore.collection('Number').getDocuments();
  //   for (var doc in x.documents) {
  //     num = doc.data['No'];
  //   }
  //   if (num % 2 == 0) {
  //     setState(() {
  //       name = 'prashant';
  //     });
  //   } else {
  //     setState(() {
  //       name = 'Rishi';
  //     });
  //   }
  //   num = num + 1;
  //   final a = await Firestore.instance.collection('Number').getDocuments();
  //   for (var temp in a.documents) {
  //     tempdocID = temp.documentID;
  //
  //     Firestore.instance
  //         .collection('Number')
  //         .document(tempdocID)
  //         .updateData({'No': num});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        title: Center(child: Text('WSD PROJECT')),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2.0, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    'Name',
                    style: TextStyle(color: Colors.lightBlue),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2.0, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    'Nan',
                    style: TextStyle(color: Colors.lightBlue),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
