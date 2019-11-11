import 'package:flutter/material.dart';

class Datails extends StatefulWidget {
  final String id;
  final String title;
  final String image;

  const Datails({Key key, this.id, this.image, this.title}) : super(key: key);
  @override
  _DatailsState createState() => _DatailsState();
}

class _DatailsState extends State<Datails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.brown, Colors.orange[100]])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          elevation: 1.0,
          backgroundColor: Colors.transparent,
        ),
        body: Hero(
          transitionOnUserGestures: true,
          tag: "test",
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(widget.image),
                ),
                SizedBox(
                  height: 30,
                ),
                Card(
                    elevation: 0.6,
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
