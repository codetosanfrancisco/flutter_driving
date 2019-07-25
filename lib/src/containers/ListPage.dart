import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  AppBar getTopAppBar(widget) {
    return AppBar(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(this.widget.title),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.list),
          tooltip: 'Show Snackbar',
          onPressed: () {},
        ),
      ],
    );
  }

  final makeBottom = BottomAppBar(
    color: Color.fromRGBO(58, 66, 86, 1.0),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.blur_on, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.hotel, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_box, color: Colors.white),
            onPressed: () {},
          ),
        ]),
  );

  final makeListTile = ListTile(
    title: Text("Introduction to Driving!",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    subtitle: Row(
      children: <Widget>[
        Icon(Icons.linear_scale, color: Colors.yellowAccent),
        Text(" Intermediate", style: TextStyle(color: Colors.white))
      ],
    ),
    trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(
        Icons.autorenew,
        color: Colors.white,
      ),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  );

  makeCard() {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile,
      ),
    );
  }

  makeBody() {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return makeCard();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: getTopAppBar(widget),
        bottomNavigationBar: makeBottom,
        body: makeBody());
  }
}
