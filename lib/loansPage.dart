import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'package:after_layout/after_layout.dart';
import 'package:flutter/services.dart';
import 'package:fluttersacco/loader.dart';
import 'package:fluttersacco/loansLogic.dart';
import 'package:fluttersacco/main.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import "formControllers.dart";

class LoansPage extends StatefulWidget {
  var userData;
  LoansPage({Key key, this.userData}) : super(key: key);

  @override
  _LoansPageState createState() => _LoansPageState();
}

Material loansPage(loan,balance){
  return Material(
    color: Colors.white,
    elevation: 40.0,
    shadowColor: Color(0x802196F3),
    borderRadius: BorderRadius.circular(24.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/login.jpeg"),
            radius: 50.0,
          ),
        ),
        Divider(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Loan Limit ",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.account_balance_wallet,
                      size: 20.0,
                    ),
                    Text((() {
                      if(balance!=null){
                        return "${balance['totalAmount']*3}.00";
                      }
                      return "---";
                    })())
                  ] ,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
            ),
            Divider(height: 30.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Loan Balance",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.account_balance_wallet,
                      size: 20.0,
                    ),
                    Text((() {
                      if(loan!=null){
                        return "${loan['totalAmount']}.00";
                      }
                      return "---";
                    })())

                  ] ,
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
        ),  ],

          ),

      );
}

class _LoansPageState extends State<LoansPage>{
  var loan,balance;
  bool _isLoading=true;

  @override
  void initState(){
    super.initState();
    getData();
  }

  getData()async{
    var jsonData=null;
    var depoFinance=null;
    var Loanresponse = await http.post("https://devsacco.herokuapp.com/api/getuserLoanAccount/",
        body:{
          "id":"${widget.userData["id"]}"
        });
    var responseBal = await http.post("https://devsacco.herokuapp.com/api/account/",
        body:{
          "id":"${widget.userData["id"]}"
        });
    jsonData=json.decode(Loanresponse.body);
    depoFinance=json.decode(responseBal.body);
    setState(() {
      loan=jsonData;
      balance=depoFinance;
      _isLoading=false;
    });
  }


  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    if(_isLoading==true){
      return Scaffold(
        appBar: AppBar(
          title:Text("Transaction reports"),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: new CircularProgressIndicator(),
        ),
      );

    }else{
      return Scaffold(
        appBar: AppBar(
          title: Text("Loan"),
        ),
        body: ListView(
          children: <Widget>[

            Column(
              children: <Widget>[
                loansPage(loan,balance),
                Form(
                  key: _formKey,
                  child: Theme(
                    data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.black,
                        labelStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                          ),
                          TextFormField(
                            controller: formControllers.amount,
                            decoration: InputDecoration(
                              labelText: 'Enter Amount',
                            ),
                            keyboardType: TextInputType.number,
                            validator: Validators.required("Amount is required"),
                            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                          ),
                          TextFormField(
                            controller: formControllers.guaranter1,
                            decoration: InputDecoration(
                              labelText: 'Primary Guaranter (optional)',
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                          ),
                          TextFormField(
                            controller: formControllers.guaranter2,
                            decoration: InputDecoration(
                              labelText: 'Secondary Guaranter (optional)',
                            ),
                            keyboardType: TextInputType.text,

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                          ),
                          TextFormField(
                            controller: formControllers.guaranter3,
                            decoration: InputDecoration(
                              labelText: 'Tertiary Guaranter (optional)',
                            ),
                            keyboardType: TextInputType.text,


                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                          ),
                          MaterialButton(
                            height: 40.0,
                            minWidth: 100.0,
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: Text(
                                "BORROW LOAN"

                            ),
                            // ignore: sdk_version_set_literal
                            onPressed: () =>
                            {

                              print("Works to here"),
                              if (_formKey.currentState.validate()) {
                                _handleSubmit(
                                    context,
                                    widget.userData["id"],
                                    formControllers.amount.text,
                                    formControllers.guaranter1.text,
                                    formControllers.guaranter2.text,
                                    formControllers.guaranter3.text),
                                print("Data sent to server"),
                              }

                            },
                            splashColor: Colors.redAccent,
                          )

                        ],
                      ),
                    ),
                  ),
                  autovalidate: true,
                ),

              ],
            ),
          ],
        ),
      );
    }
  }
  static Future<void> _handleSubmit(BuildContext context,user,amount,guaranter1,guaranter2,guaranter3) async {
    int amounInt=int.parse(amount);
//  print(user.runtimeType);
    final GlobalKey<State> _keyLoader = new GlobalKey<State>();
    try {
      Dialogs.showLoadingDialog(context, _keyLoader);
      var res = await LoansLogic.borrowLoan(user,amounInt,guaranter1,guaranter2,guaranter3);
      print(res);
      if (res["message"]=="success"){
        Navigator.of(context).pop();
        Dialogs.showSuccessDialog(context,"Your request of a loan ksh ${amount}/= with guaranters ${guaranter1} ${guaranter2} ${guaranter3} has been successfully placed in queue.Pending Approval   ");
//        Future.delayed(Duration(seconds: 8), () {
//          Navigator.of(context).pop(true);
//        });
      }else if(res["status"]==500){
        Future.delayed(const Duration(milliseconds: 1500), () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder:
                  (BuildContext context) => signUp()));
        });
        print("=======================res coming up===============================");
        print(res);
        Dialogs.showErrorDialog(context,res);

        print("===============================================================================");
        print(res);
      }
    } catch (error) {
      print(error);
    }
  }
}
