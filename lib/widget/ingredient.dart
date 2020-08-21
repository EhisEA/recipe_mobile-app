import "package:flutter/material.dart";

class Ingredient extends StatelessWidget {
  
  String name;
  Ingredient({this.name});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(10),
      padding:EdgeInsets.all(10) ,
      // width: MediaQuery.of(context).size.width<500? MediaQuery.of(context).size.width-30: 500,
      // height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.black.withOpacity(0.5)
      ),
      child:Row(
        children:[
          Icon(Icons.star, color: Colors.yellow,),
          Container(width:MediaQuery.of(context).size.width-70,
            child: Text(name, style: TextStyle(color: Colors.white)))
        ]
      )
    );
  }
}