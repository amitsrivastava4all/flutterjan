import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  var user;
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  _loginWithGmail() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gsa = await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: gsa.idToken, accessToken: gsa.accessToken);
    AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    setState(() {
      this.user = user;
    });
    print("User Details are ${user.providerData}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: RaisedButton(
                color: Colors.orangeAccent,
                onPressed: () {
                  _loginWithGmail();
                },
                child:
                    Text('Login with Google', style: TextStyle(fontSize: 30)),
              ),
            ),
            Image.network(
              user != null
                  ? user.photoUrl
                  : 'https://www.shareicon.net/data/256x256/2016/09/15/829459_man_512x512.png',
              height: 150,
              width: 150,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'User Details are ${user != null ? user.displayName : ''}',
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      )),
    );
  }
}
