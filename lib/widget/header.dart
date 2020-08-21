import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            color: Colors.red.withOpacity(0.5),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(
                "Get",
                style:TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900
                ),
              ),
              Text(
                "Recipe",
                style:TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w900

                )
            )])

          );
  }
}