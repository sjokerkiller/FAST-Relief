import 'package:fast_relief/services/auth.dart';
import 'package:fast_relief/shared/constants.dart';
import 'package:fast_relief/shared/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Color(0xFFFFFEE9),
      //backgroundColor: Colors.green[150],
      appBar: AppBar(
        backgroundColor: Color(0xFFA8A676),
        elevation: 0.0,
        title: Text('Welcome',
          style: TextStyle(fontFamily: 'Cream Cake', fontSize: 50),
        ),
        centerTitle: true,
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(
                Icons.person,
              color: Color(0xFF963A2F),
            ),
            label: Text('Register'),
            style: TextButton.styleFrom(primary: Color(0xFF963A2F)),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          /*decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pngtree-zen-culture-buddha-culture-background-design-image_189115.jpg'),
              fit: BoxFit.fill,
            ),
          ),*/
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                child: Image.asset('assets/images/Logo_FAST Relief .png'),
                ),
                SizedBox(height: 50.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
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
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                        if(result == null) {
                          setState(() {
                            error = 'Could not sign in with those credentials';
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
