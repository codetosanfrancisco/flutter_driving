import 'package:flutter/material.dart';
import '../../models/Lesson.dart';
import '../../data/Lessons.dart';
import '../components/DetailPage.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return ListPageState();
  }
}

class ListPageState extends State<ListPage> {
  List<Lesson> lessons;

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

  ListTile makeListTile(Lesson lesson) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DetailPage(lesson: lesson);
        }));
      },
      title: Text(lesson.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      subtitle: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: LinearProgressIndicator(
                  backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                  value: lesson.indicatorValue,
                  valueColor: AlwaysStoppedAnimation(Colors.green)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                lesson.level,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
      trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
            border:
                Border(right: BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(
          Icons.autorenew,
          color: Colors.white,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    );
  }

  Card makeCard(Lesson lesson) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(lesson),
      ),
    );
  }

  makeBody() {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );
  }

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
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
