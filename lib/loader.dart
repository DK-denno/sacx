import 'package:flutter/material.dart';
import 'dart:math';

void main()=>runApp(MaterialApp(
  home:Loader(),
  theme: new ThemeData(
    primarySwatch: Colors.blue,
  ),


));



class Loader extends StatefulWidget {
  @override
  LoaderState createState() => LoaderState();

}

class LoaderState extends State<Loader> with SingleTickerProviderStateMixin {

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radiusIn;
  Animation<double> animation_radiusOut;
  final double initialRadius = 15.0;
  double radius=0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 5));

    animation_rotation=Tween<double>(
        begin: 0.0,
        end:1.0
    ).animate(CurvedAnimation(parent:controller,curve: Interval(
        0.0,1.0,curve:Curves.linear
    )));

    animation_radiusIn = Tween<double>(
        begin: 1.0,
        end: 0.0
    ).animate(CurvedAnimation(parent:controller,curve:Interval(
        0.75,1.0,curve: Curves.elasticIn
    )));
    animation_radiusOut = Tween<double>(
        begin: 0.0,
        end: 1.0
    ).animate(CurvedAnimation(parent:controller,curve:Interval(
        0.0,0.25,curve: Curves.elasticOut
    )));
    controller.addListener(() {
      setState(() {
        if(controller.value>=0.75 && controller.value<=1.0){
          radius=animation_radiusIn.value*initialRadius;
        }else if(controller.value>=0.0 && controller.value<=0.25){
          radius=animation_radiusOut.value*initialRadius;
        }
      });
    });
    controller.repeat();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: RotationTransition(
        turns: animation_rotation,
        child: Center(
          child: Stack(
            children: <Widget>[
              Dot(
                radius: 15.0,
                color: Colors.blue,
              ),
              Transform.translate(
                offset: Offset(radius*cos(pi),radius*sin(pi)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.red,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(pi/4),radius*sin(pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.orange,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(2*pi/4),radius*sin(2*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.yellow,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(3*pi/4),radius*sin(3*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.green,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(4*pi/4),radius*sin(4*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.blue,
                ),
              ), Transform.translate(
                offset: Offset(radius*cos(5*pi/4),radius*sin(5*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.indigo,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(6*pi/4),radius*sin(6*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.purpleAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(7*pi/4),radius*sin(7*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.teal,
                ),
              ),
              Transform.translate(
                offset: Offset(radius*cos(8*pi/4),radius*sin(8*pi/4)),
                child: Dot(
                  radius: 5.0,
                  color: Colors.blueGrey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({this.radius,this.color});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width:this.radius,
        height: this.radius,
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}


class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        Loader(),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }
  static void showErrorDialog(context,message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 5), () {
          Navigator.of(context).pop(true);
        });
        // return object of type Dialog
        return AlertDialog(

          elevation:1.0,
          title: new Text("Error"),
          content: new Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

