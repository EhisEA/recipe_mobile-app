import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:recipe/models/Recipe.dart';
import 'package:recipe/pages/displayRecipe.dart';

class RecipeView extends StatelessWidget {
  Recipe recipe;
  RecipeView({this.recipe});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayRecipe(recipe: recipe,)));
      },
          child: Container(
        margin: EdgeInsets.all(8),
        //       width:180,
        //       height:180,
        child: Stack(
          children:[
            Container(
              
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(recipe.imageUrl)
                )
              )
            ),
            Positioned(
              bottom: 0,
              child:Container(
                padding: EdgeInsets.only(left:8, right: 15),
                // width: P,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white54,
                      Colors.white12
                      ])
                ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Container(width: 120,child: Text(recipe.label,style: TextStyle(fontWeight: FontWeight.bold),)),
                  SizedBox(height:8),
                  Row(
                    children: <Widget>[
                      Icon(Icons.person_pin, color: Colors.black.withOpacity(0.7)),
                      SizedBox(width:10),
                      Text(recipe.source, style: TextStyle(color:Colors.black.withOpacity(0.7),fontWeight: FontWeight.w500),),
                    ],
                  ),
                ]
              )
          )
            )

          ]
        )
      ),
    );
  }
}