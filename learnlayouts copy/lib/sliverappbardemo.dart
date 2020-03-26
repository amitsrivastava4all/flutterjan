import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatelessWidget {
  _createPopUpMenu() {
    return PopupMenuButton<String>(
      icon: Icon(Icons.more_vert),
      initialValue: 'Chat',
      onSelected: (String currentValue){
        print("U Selected $currentValue");
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem<String>(value: 'Chat', child: Text('Chat')),
          PopupMenuItem<String>(value: 'Messages', child: Text('Messages')),
          PopupMenuItem<String>(value: 'Calls', child: Text('Calls'))
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const url =
        'https://img1.looper.com/img/gallery/deadpool-3-release-date-plot-cast-and-trailer/intro-1577731231.jpg';
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: <Widget>[_createPopUpMenu()],
            floating: false,
            pinned: true,
            elevation: 5,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                url,
                fit: BoxFit.cover,
              ),
              title: Text('DeadPool'),
            ),
            expandedHeight: 300,
          ),
          SliverFillRemaining()
        ],
      ),
    );
  }
}
