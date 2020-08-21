import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration:
              BoxDecoration(image: DecorationImage(image: NetworkImage(""))),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(90),
                topRight: Radius.circular(90),
              ),
            ),
            child: Column(children: [
              Row(children: []),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Divider(),
              ),
              Text("Ingredients"),
              ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("url"))),
                      ),
                      Text("name")
                    ],
                  )
                ],
              )
            ]),
          ),
        ),
        Positioned(
          bottom: 250,
          child: CircleAvatar(
              radius: 50, child: Icon(Icons.favorite, color: Colors.white)),
        ),
        Positioned(
          child: Container(
            height: 200,
            width: 300,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(10),
                  child: Text("Burger"),
                ),
                Text("The Classic \n Burger")
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
