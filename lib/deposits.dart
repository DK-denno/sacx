import "package:flutter/material.dart";
import 'package:fluttersacco/formControllers.dart';
import 'package:fluttersacco/loader.dart';
import "package:http/http.dart" as http;
import "depositLogic.dart";


void main()=>runApp(MaterialApp(
  home:depositsDialog(),
  theme: new ThemeData(
  primarySwatch: Colors.blue,
  ),

));

class depositsDialog extends StatefulWidget {
  var userData;
  depositsDialog({Key key, this.userData}) : super(key: key);

  @override
  _depositsDialogState createState() => _depositsDialogState();
}

class _depositsDialogState extends State<depositsDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title:Text("Cash deposists"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: AlertDialog(

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32.0))),
        contentPadding: EdgeInsets.only(top: 10.0),
        content: Container(
          width: 300.0,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Mpesa",
                    style: TextStyle(fontSize: 24.0),
                  ),

                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(
                color: Colors.grey,
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  controller: formControllers.amount,
                  decoration: InputDecoration(
                    hintText: "Enter Amount",
                    border: InputBorder.none,
                  ),
                  maxLines: 1,
                ),
              ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32.0),
                        bottomRight: Radius.circular(32.0)),
                  ),
                  child: Text(
                    "Deposit Cash",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                onTap: (){
                  print("depo");
                  _handledeposits(context,widget.userData["id"],formControllers.amount.text);
                  print("done depo");
                },
              ),
            ],
          ),

        ),
      ),
    );

  }

  static Future<void> _handledeposits(BuildContext context,user,amount) async {
    int amounInt=int.parse(amount);
    final GlobalKey<State> _keyLoader = new GlobalKey<State>();
    try {
      Dialogs.showLoadingDialog(context, _keyLoader); //invoking login
      var res = await depositLogic.deposit(amounInt,user);
      print("reeeees\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
      print(res);
      print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
      if (res['status']==200){
        print(res);
      }else if(res['status']==500){
        print(res);
      }
    } catch (error) {
      print(error);
    }
  }
}



