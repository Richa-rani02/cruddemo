import 'package:cruddemo/register.dart';
import 'package:cruddemo/utils/Auth.dart';
import 'package:cruddemo/utils/validate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Widgets/CustomButtun.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login>with Validation {
  TextFormField _email;
  TextFormField _password;
  TextEditingController emailcontroller;
  TextEditingController passwordcontroller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _email = new TextFormField(
      obscureText: false,
      cursorColor: Colors.black,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,

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
    _password = new TextFormField(
      obscureText: true,
      cursorColor: Colors.black,
      keyboardType: TextInputType.visiblePassword,
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
                'Sign In',
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
                  top: 45.0, bottom: 5.0, left: 30.0, right: 30.0),
              child: new CustomButtun(
                title: 'sign In',
                textColor: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.amber,
                onPressed: () {},
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 5.0, left: 30.0, right: 30.0),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => register()));
                  },
                  child: Text(
                    " Don't have Account? Signup",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: 5.0, bottom: 10.0, left: 30.0, right: 30.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: new Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Divider(
                          color: Colors.black87,
                          height: 50.0,
                        ),
                      )),
                      Text(
                        'OR',
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                      Expanded(
                          child: new Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider(
                          color: Colors.black87,
                          height: 50.0,
                        ),
                      )),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'images/googleicon.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                  /*Image.asset(
                    'images/googleicon.png',
                  ),*/
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
