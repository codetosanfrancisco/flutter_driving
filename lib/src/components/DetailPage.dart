import 'package:flutter/material.dart';
import '../../models/Lesson.dart';

class DetailPage extends StatelessWidget {
  final Lesson lesson;

  DetailPage({this.lesson});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[_topContent(context), _bottomContent(context)],
      ),
    );
  }

  Widget _topContent(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          //Decoration is like background properties
          decoration: BoxDecoration(
              image: DecorationImage(
            image: ExactAssetImage('assets/drive-steering-wheel.jpg'),
            fit: BoxFit.cover,
          ))),
      Container(
        height: MediaQuery.of(context).size.height * 0.5,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 0.9)),
        child: Center(child: _getTopContextText()),
      ),
      Positioned(
        left: 8.0,
        top: 60.0,
        child: InkWell(
          child: Icon(Icons.arrow_back, color: Colors.white),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      )
    ]);
  }

  Widget _getTopContextText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60.0),
        Icon(
          IconData(0xe900, fontFamily: 'driving'),
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.green),
        ),
        SizedBox(height: 10.0),
        Text(
          lesson.title,
          style: TextStyle(
              color: Colors.white, fontSize: 45.0, fontFamily: 'Raleway'),
        ),
        SizedBox(height: 30.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _levelIndicator(),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  lesson.level,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: _coursePrice(),
            )
          ],
        )
      ],
    );
  }

  Widget _levelIndicator() {
    return Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
            value: lesson.indicatorValue,
            valueColor: AlwaysStoppedAnimation(Colors.green)),
      ),
    );
  }

  Widget _coursePrice() {
    return Container(
        padding: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "\$" + lesson.price.toString(),
              style: TextStyle(color: Colors.white),
            )
          ],
        ));
  }

  Widget _bottomContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Center(
          child: Column(
        children: <Widget>[_bottomContextText(), _readButton()],
      )),
    );
  }

  Widget _bottomContextText() {
    return Text(
      lesson.content,
      style: TextStyle(fontSize: 18.0),
    );
  }

  Widget _readButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Text(
          "TAKE THIS LESSON",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }
}
