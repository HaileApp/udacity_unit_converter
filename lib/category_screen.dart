import 'package:flutter/material.dart';

class CategoryRoute extends StatefulWidget{

  CategoryRoute();
  @override
  _CategoryRouteState createState() => _CategoryRouteState();

}

class _CategoryRouteState extends State<CategoryRoute>{


  @override
  Widget build(BuildContext context){
    return Center(
      child: Container(
        height: 180.0,
        width: 180.0,
        child: CircularProgressIndicator(),
      ),
    );
  }
}