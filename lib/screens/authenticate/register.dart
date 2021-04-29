import 'package:fast_relief/services/auth.dart';
import 'package:fast_relief/shared/constants.dart';
import 'package:fast_relief/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

  //text field state
  String firstName = '';
  String lastName = '';
  String music = '';
  String hobbies = '';
  String email = '';
  String password = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Color(0xFFFFFEE9),
      appBar: AppBar(
        backgroundColor: Color(0xFFA8A676),
        elevation: 0.0,
        title: Text('Register',
          style: TextStyle(fontFamily: 'Cream Cake', fontSize: 50),
        ),
        centerTitle: true,
        actions: <Widget>[
          TextButton.icon(
              icon: Icon(
                Icons.person,
                color: Color(0xFF963A2F),
              ),
              label: Text('Sign In'),
              style: TextButton.styleFrom(primary: Color(0xFF963A2F)),
              onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'First Name'),
                    validator: (val) => val.isEmpty ? 'Enter a name' : null,
                    onChanged: (val) {
                      setState(() => firstName = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Last Name'),
                    validator: (val) => val.isEmpty ? 'Enter a name' : null,
                    onChanged: (val) {
                      setState(() => lastName = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Favorite Music genre'),
                    validator: (val) => val.isEmpty ? 'Enter a music genre' : null,
                    onChanged: (val) {
                      setState(() => music = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Favorite hobby'),
                    validator: (val) => val.isEmpty ? 'Enter a hobby' : null,
                    onChanged: (val) {
                      setState(() => hobbies = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Email'),
                      //new
                      keyboardType: TextInputType.emailAddress,
                      //end new
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                      onChanged: (val) {

                        setState(() => password = val);
                      },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.brown[400],
                        onPrimary: Colors.white,
                      ),
                      child: Text(
                          'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()){
                          setState(() => loading = true);
                          dynamic result = await _auth.registerWithEmailAndPassword(email, password, firstName, lastName, music, hobbies);
                          if (result == null){
                            setState(() {
                              error = 'please supply a valid email';
                              loading = false;
                            });
                            }
                          }
                        }
                        ),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
