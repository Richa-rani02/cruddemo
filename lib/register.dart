import 'package:flutter/material.dart';

import 'Widgets/CustomButtun.dart';


class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  TextField _email;
  TextField _password;
  TextField _name;
  TextField _mobile;
  TextEditingController emailcontroller;
  TextEditingController passwordcontroller;
  TextEditingController namecontroller;
  TextEditingController mobilecontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email = new TextField(
      obscureText: false,
      cursorColor: Colors.black,
      controller: emailcontroller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        labelText: 'Email',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
    _password = new TextField(
      obscureText: true,
      cursorColor: Colors.black,
      controller: passwordcontroller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
    _name = new TextField(

      cursorColor: Colors.black,
      controller: namecontroller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        labelText: 'Name',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
    _mobile = new TextField(

      cursorColor: Colors.black,
      controller: mobilecontroller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.amber),
        ),
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
        labelText: 'Mobile Number',
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: SafeArea(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: 50.0, left: 10.0, bottom: 10.0, right: 10.0),
                  child: Text(
                    'Sign Up',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Color.fromRGBO(10, 45, 80, 2),
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                      fontFamily: "OpenSans",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 50.0, bottom: 10.0, left: 20.0, right: 20.0),
                  child: _email,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 35.0, bottom: 10.0, left: 20.0, right: 20.0),
                  child: _password,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 35.0, bottom: 10.0, left: 20.0, right: 20.0),
                  child: _name,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 35.0, bottom: 10.0, left: 20.0, right: 20.0),
                  child: _mobile,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 45.0, bottom: 5.0, left: 30.0, right: 30.0),
                  child: new CustomButtun(
                    title: 'sign Up',
                    textColor: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.amber,
                    onPressed: () {},
                  ),
                ),


              ],
            )),
      ),
    );
  }
}
