import "package:flutter/material.dart";
import 'package:recipe/models/Recipe.dart';
import 'package:recipe/widget/ingredient.dart';
import 'package:recipe/widget/header.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayRecipe extends StatelessWidget {
  Recipe recipe;
  DisplayRecipe({this.recipe});
  _launchUrl(url) async{
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body:Container(
          decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0Xff0d324d),
                      Color(0Xff7f5a83)
                      ])
                  ),
          child: Column(
          children: <Widget>[
            Header(),
            SizedBox(height:3),
            Container(
              height:MediaQuery.of(context).size.height-100,
              width:MediaQuery.of(context).size.width,
              child: ListView(children: <Widget>[
                Container(
                  height:300,
                  width:MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(recipe.imageUrl))
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(recipe.label,style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                    child:Row(
                    children: <Widget>[
                      Icon(Icons.person_pin, color: Colors.white.withOpacity(0.7)),
                      SizedBox(width:10),
                      Text(recipe.source,style:TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5))),
                    ],
                  ),
                  ),
                  InkWell(
                    onTap: (){
                      _launchUrl(recipe.url);
                    },
                                      child: Container(   
                      height: 20,
                      width:90,
                      decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0Xff55efc4),
                        
                        Color(0Xff000),
                        ])
                    ),
                    child:Center(child: Text("visit site", style: TextStyle(color:Colors.white, fontWeight: FontWeight.w700,fontSize: 15),))
                    ),
                  )
                    ],
                  )
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top:29,left: 10,bottom: 5),
                  child: Text("Ingredients", style: TextStyle(color:Colors.white.withOpacity(0.9), fontWeight: FontWeight.w700, fontSize: 18,)),
                ),
                
               Column(
                 children:  List<Widget>.generate(recipe.ingredient.length, (index){
                  return Ingredient(name:recipe.ingredient[index].toString());
                }),
               )

              ],),
            )
          ],
      ),
        )
      ),
    );
  }
}