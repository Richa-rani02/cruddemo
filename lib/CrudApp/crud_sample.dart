import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cruddemo/CrudApp/create.dart';
import 'package:cruddemo/CrudApp/fetch.dart';

import 'package:cruddemo/Widgets/CustomButtun.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';



class CrudSample extends StatefulWidget {
  @override
  CrudSampleState createState() {
    return new CrudSampleState();
  }
}

class CrudSampleState extends State<CrudSample> {
  String myText;
  StreamSubscription<DocumentSnapshot> subscription;

  final DocumentReference documentReference =
      Firestore.instance.document("myData/dummy");



  /*Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    print("User Name : ${user.displayName}");
    return user;
  }

  void _signOut() {
    googleSignIn.signOut();
    print("User Signed out");
  }*/

  void _add() {
    Map<String, String> data = <String, String>{
      "name": "Pawan Kumar",
      "desc": "Flutter Developer"
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }

  void _delete() {
    documentReference.delete().whenComplete(() {
      print("Deleted Successfully");
      setState(() {});
    }).catchError((e) => print(e));
  }

  void _update() {
    Map<String, String> data = <String, String>{
      "name": "Pawan Kumar Updated",
      "desc": "Flutter Developer Updated"
    };
    documentReference.updateData(data).whenComplete(() {
      print("Document Updated");
    }).catchError((e) => print(e));
  }

  void _fetch() {
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = datasnapshot.data['desc'];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = documentReference.snapshots().listen((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = datasnapshot.data['desc'];
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new Container(
        padding: const EdgeInsets.all(20.0),

        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: new Image.asset(
                'images/logovertical.png',
                height: 125.0,
                width: 125.0,

              ),

            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new CustomButtun(
              title: 'Add',
              textColor: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(10, 45, 80, 2),
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Add()));
              },

            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new CustomButtun(
              title: 'Update',
              textColor: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(10, 45, 80, 2),
              onPressed: _update,

    ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new CustomButtun(
              title: 'Delete',
              textColor: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(10, 45, 80, 2),
              onPressed: _delete,

            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new CustomButtun(
              title: 'Fetch',
              textColor: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(10, 45, 80, 2),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>fetch()));
              },

            ),

            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            myText == null
                ? new Container()
                : new Text(
                    myText,
                    style: new TextStyle(fontSize: 20.0),
                  )
          ],
        ),
      ),
    );
  }
}
