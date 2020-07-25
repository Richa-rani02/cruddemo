import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final _namecontroller = new TextEditingController();
  final _jobcontroller = new TextEditingController();
  bool update = false;
  final DocumentReference documentReference =
      Firestore.instance.collection("MyData").document();

  void _add() {
    Map<String, String> data = <String, String>{
      "name": _namecontroller.text,
      "desc": _jobcontroller.text,
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
    _namecontroller.clear();
    _jobcontroller.clear();
  }

  _delete(item) {
    final DocumentReference doc =
        Firestore.instance.collection("MyData").document(item);
    doc.delete().whenComplete(() {
      print("Deleted Successfully");
    });
  }

  _update() {
    Map<String, String> data = <String, String>{
      "name": _namecontroller.text,
      "desc": _jobcontroller.text
    };
    final DocumentReference doc =
        Firestore.instance.collection("MyData").document();
    doc.updateData(data).whenComplete(() {
      print("Document Updated");
    }).catchError((e) => print(e));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30.0,
                      ),
                      TextField(
                        cursorColor: Color.fromRGBO(10, 45, 80, 2),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          labelText: 'Name',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        controller: _namecontroller,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        cursorColor: Color.fromRGBO(10, 45, 80, 2),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                          labelText: 'Job Description',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                        ),
                        controller: _jobcontroller,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    RaisedButton.icon(
                      onPressed: _add,
                      label: Text(
                        'Add ',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      icon: Icon(Icons.add),
                      elevation: 0.0,
                      padding: const EdgeInsets.all(14.0),
                      color: Colors.amber,
                    ),
                    RaisedButton.icon(
                      onPressed:(){

                      },
                      label: Text(
                        'Update',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      icon: Icon(Icons.update),
                      elevation: 0.0,
                      padding: const EdgeInsets.all(14.0),
                      color: Colors.amber,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                SingleChildScrollView(
                  child: StreamBuilder(
                      stream:
                          Firestore.instance.collection("MyData").snapshots(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
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
                                              onPressed: () {
                                                update = true;
                                                _namecontroller.text =
                                                    documentSnapshot['name'];
                                                _jobcontroller.text =
                                                    documentSnapshot['desc'];
                                                /*_update(documentSnapshot
                                                    .documentID);*/
                                              }),
                                          IconButton(
                                              icon: Icon(Icons.delete),
                                              color: Colors.red,
                                              onPressed: () {
                                                _delete(documentSnapshot
                                                    .documentID);
                                              }),
                                        ],
                                      )),
                                ),
                              );
                            });
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
