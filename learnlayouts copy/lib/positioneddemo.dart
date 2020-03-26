import 'package:flutter/material.dart';

class PositionDemo extends StatelessWidget {
  _positionElements(context) {
    const url =
        'https://img1.looper.com/img/gallery/deadpool-3-release-date-plot-cast-and-trailer/intro-1577731231.jpg';
    var media = MediaQuery.of(context).size;
    return Positioned(
      top: 100,
      width: 400,
      height: media.height,
      child: Column(
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover),
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(100)),
                boxShadow: [BoxShadow(blurRadius: 7, color: Colors.black)]),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Dead Pool',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Avaliable',
            style: TextStyle(fontSize: 30, color: Colors.blue),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Followers',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '98765',
                    style: TextStyle(fontSize: 40),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Likes',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '1000',
                    style: TextStyle(fontSize: 40),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Comments',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '3000',
                    style: TextStyle(fontSize: 40),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: media.height,
        width: media.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.orangeAccent, Colors.greenAccent])),
        child: Stack(
          children: <Widget>[_positionElements(context)],
        ),
      ),
    );
  }
}
