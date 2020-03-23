import 'package:flutter/material.dart';

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        pageSnapping: false,
        // pageSnapping: true,
        onPageChanged: (value) => print(value),
        //scrollDirection: Axis.vertical,
        scrollDirection: Axis.horizontal,

        children: <Widget>[
          Page1(),
          Page2(),
          Page3(),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.lightBlue,
      ),
      child: Column(
        children: <Widget>[
          TextField(),
          RaisedButton(
            onPressed: () {},
            child: Text('Button'),
          ),
          Center(
            child: Text(
              "Page One",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Center(
        child: Text(
          "Page Two",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Center(
        child: Text(
          "Page Three",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
