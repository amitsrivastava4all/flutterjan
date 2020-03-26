import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  _createTextField() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(fontSize: 30),
        decoration: InputDecoration(
            hintText: "Type Userid Here",
            prefixIcon: Icon(Icons.person, size: 30, color: Colors.redAccent),
            contentPadding: EdgeInsets.all(20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  _createLoginButton() {
    return Container(
      child: MaterialButton(
        minWidth: 200,
        onPressed: () {},
        padding: EdgeInsets.all(10),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 30),
        ),
        color: Colors.blueAccent,
      ),
    );
  }

  _createPasswordField() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        obscureText: true,
        style: TextStyle(fontSize: 30),
        decoration: InputDecoration(
            hintText: "Type Password Here",
            prefixIcon: Icon(Icons.person, size: 30, color: Colors.redAccent),
            contentPadding: EdgeInsets.all(20),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    const imageURL =
        'https://www.popsci.com/resizer/Ru1faiQZq819LwQi_cTjH0q_oIg=/1200x628/smart/arc-anglerfish-arc2-prod-bonnier.s3.amazonaws.com/public/C73QN2XYCKOMCGZCUYXJV7XELY.jpg';
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(imageURL, fit: BoxFit.cover),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://icons.iconarchive.com/icons/iconshock/batman/256/Logo-icon.png',
                width: 100,
                height: 100,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: media.height * 0.50,
                    width: media.width * 0.90,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 50),
                        _createTextField(),
                        _createPasswordField(),
                        _createLoginButton()
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
