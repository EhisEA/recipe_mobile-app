import 'dart:convert';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import 'package:recipe/models/Recipe.dart';
import 'package:recipe/widget/recipeView.dart';
import 'package:recipe/widget/header.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textController = new TextEditingController();
  List<Recipe> recipes= new List<Recipe>();



  BannerAd _bannerAd;

  InterstitialAd _interstitialAd;

  BannerAd createBannerAd(){
    return BannerAd(
      adUnitId: "ca-app-pub-2847477557757337/1369713108",
      size: AdSize.banner,
      // targetingInfo: targetingInfo,
      listener: (MobileAdEvent event){
        print("bannerAd $event");
      }
    );
  }

@override
  void initState() {
    
    FirebaseAdMob.instance.initialize(
      appId: "ca-app-pub-2847477557757337~6996416633"
    );
    _bannerAd = createBannerAd()..load()..show();
    
    // Admob.initialize("ca-app-pub-2847477557757337~3549794511");
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    _interstitialAd.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                     begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                   
                    colors: [
                    Color(0Xff0d324d),
                    Color(0Xff7f5a83)
                    ])
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                ),
            Header(),
            Positioned(
              top: 100,
              child: Container(
                width: MediaQuery.of(context).orientation==Orientation.portrait?
                MediaQuery.of(context).size.width-40:300,
                padding: EdgeInsets.only(left:30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("What would you want to cook today?",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w900
                        ),
                    ),
                    SizedBox(height:10),
                    Text("Get access to over a million recipe ",
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        )
                    ),
                    SizedBox(height:10),
                    Text(
                        "Just enter the ingredients you have and we would get the best recipe for you ",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                        )),
                    Container(
                      width: 600,
                      child: Row(
                        children:[ 
                          Expanded(
                            child: TextField(
                              controller: textController,
                              decoration: InputDecoration(
                                hintText: "Enter Ingredient",
                                hintStyle: TextStyle(color: Colors.white.withOpacity(0.5))
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width:20),
                          IconButton(
                          icon: Icon(Icons.search, color: Colors.white,), 
                          onPressed: (){
                             if(textController.text.isEmpty){
                                print("empty");
                              }else{
                                findRecipe(textController.text);
                              }
                          }
                          )
                   ]),
                    )
                    
                  ],

                ),
              ),
            ),
            Positioned(
              // MediaQuery.of(context).orientation==Orientation.portrait?
              //   MediaQuery.of(context).size.width-40:300,
              top: MediaQuery.of(context).orientation==Orientation.portrait?250:60,
              right: 0 ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Results:",style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w900)),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom:10),
                            height:MediaQuery.of(context).orientation==Orientation.portrait?
                             MediaQuery.of(context).size.height-310 :MediaQuery.of(context).size.height-120,
                            width:MediaQuery.of(context).orientation==Orientation.portrait?
                             MediaQuery.of(context).size.width:MediaQuery.of(context).size.width -300,
                            child:GridView(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent:200, mainAxisSpacing:10.0),
                              children: List.generate(recipes.length, (index){
                                return GridTile( 
                                  child:RecipeView(
                                  recipe:recipes[index]
                                  )
                                );
                              }),
                              )
                            ),
                        ],
                      )
                      )
          ],
        ),
      ),
    );
  }

  findRecipe(String query) async{
    recipes= new List<Recipe>();
     String url = "https://api.edamam.com/search?q=$query&app_id=045beb36&app_key=8367ae8d26be6a790b175a45df519012";
     var response = await http.get(url);
    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["hits"].forEach((value){
      Recipe recipe = new Recipe();
      recipe= Recipe.fromMap(value["recipe"]);
      recipes.add(recipe);
        // print("recipes:' "+ value.toString());
    });
    // print("recipes:' "+ recipes.length.toString());
   setState(() {
      
      });
  }
}
