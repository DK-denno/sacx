import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttersacco/main.dart';




class reports extends StatefulWidget {
  @override
  _reportsState createState() => _reportsState();
}

class _reportsState extends State<reports> {

  Material myTiles(IconData icon,String title,Color color) {
    return Material(
      color: color,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
        child:Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("   "),
                Icon(Icons.calendar_today,color: Colors.red),
                Text(" 12th June"),

              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("           "),
                Text("Inward:Loan payment",style: TextStyle(fontSize: 17.0)),
                Text(" 5000",style: TextStyle(fontSize: 17.0)),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                  Text("          "),
                Flexible(child: Text("Lorem diowgvbsdjhbvsfh vsdjvbdsuckbv dxvsfc vuisieufb dsivuk ",overflow: TextOverflow.visible,))
              ],
            )

          ],
        ),

    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction reports"),
       backgroundColor: Colors.blue,
      ),
      body:StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
        children: <Widget>[
         Column(
           children: <Widget>[
             Row(
               children: <Widget>[
                 CircleAvatar(
                   radius: 70.0,
                 ),
               ],
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text("   "),
                 Text("Name: Placeholder username",style: TextStyle(fontSize: 20.0),),
               ],
             ),

           ],
         ),
          myTiles(Icons.receipt,"Reports",Colors.white),
          myTiles(Icons.receipt,"Reports",Colors.green),
          myTiles(Icons.receipt,"Reports",Colors.white),
          myTiles(Icons.receipt,"Reports",Colors.green),
          myTiles(Icons.receipt,"Reports",Colors.white),
          myTiles(Icons.receipt,"Reports",Colors.green),
          myTiles(Icons.receipt,"Reports",Colors.white),
          myTiles(Icons.receipt,"Reports",Colors.green),
          myTiles(Icons.receipt,"Reports",Colors.white),
          myTiles(Icons.receipt,"Reports",Colors.green),
          myTiles(Icons.receipt,"Reports",Colors.white),
          myTiles(Icons.receipt,"Reports",Colors.green),
          myTiles(Icons.receipt,"Reports",Colors.white),
          myTiles(Icons.receipt,"Reports",Colors.green),
          myTiles(Icons.receipt,"Reports",Colors.white),
          myTiles(Icons.receipt,"Reports",Colors.green),
          myTiles(Icons.receipt,"Reports",Colors.green),



        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 200.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),
          StaggeredTile.extent(2, 90.0),


        ],
      ),
    );
  }
}
