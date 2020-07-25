import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'create.dart';

class fetch extends StatefulWidget {
  @override
  _fetchState createState() => _fetchState();
}

class _fetchState extends State<fetch> {
  final DocumentReference documentReference =
      Firestore.instance.collection("MyData").document();

  _delete(item) {
    final DocumentReference doc=
    Firestore.instance.collection("MyData").document(item);
        doc.delete()
        .whenComplete(() {
      print("Deleted Successfully");

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: Firestore.instance.collection("MyData").snapshots(),
          builder: (context, snapshot) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      snapshot.data.documents[index];
                  // ignore: missing_return
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      title: Text(
                        documentSnapshot["name"],
                        style: TextStyle(color: Colors.black87),
                      ),
                      subtitle: Text(
                        documentSnapshot["desc"],
                        style: TextStyle(color: Colors.black87),
                      ),
                      trailing: FittedBox(
                          fit: BoxFit.fill,
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  color: Colors.blue,
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Add()));
                                  }),
                              IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed:(){
                                    _delete(documentSnapshot.documentID);
                                  }
                                     ),
                            ],
                          )),
                    ),
                  );
                });
          }),
    );
  }
}
