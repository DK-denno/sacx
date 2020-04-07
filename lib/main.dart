import 'dart:convert';
import 'package:after_layout/after_layout.dart';
import 'dart:io';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttersacco/AuthLogic.dart';
import 'package:fluttersacco/deposits.dart';
import 'package:fluttersacco/reportsUi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'AuthLogic.dart';
import 'formControllers.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'loader.dart';
import 'loader.dart';
import "profile.dart";
import "loansPage.dart";
import 'profileLogic.dart';
import "testList.dart";


void main()=>runApp(MaterialApp(
  home:reports(),
  theme: new ThemeData(
    primarySwatch: Colors.blue,
  ),
  routes: <String, WidgetBuilder>{
    "/login" : (BuildContext context)=> login(),
    //add more routes here
  },

));

class login extends StatefulWidget {

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> with SingleTickerProviderStateMixin {

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  bool _isloading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        curve: Curves.easeOut
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/login.jpeg'),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Divider(
                height: 100.0,
              ),
              Center(
                child: Image(
                  image: AssetImage('assets/kag.jpeg'),
                  width: 200,
                  height: 150,
                ),
              ),
              Form(
                key: _formKey,
                child: Theme(
                  data: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.teal,
                          fontSize: 20.0,
                        )
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          controller: usernameconroller,
                          decoration: InputDecoration(
                            labelText: 'Enter Username',

                          ),
                          keyboardType: TextInputType.text,
                          validator: Validators.required("Username is required"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                        ),
                        TextFormField(
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            labelText: 'Enter Password',
                          ),
                          validator: Validators.required("Password is required"),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                        ),
                        MaterialButton(
                          height: 40.0,
                          minWidth: 100.0,
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: Text(
                              "LOGIN"
                          ),
                          // ignore: sdk_version_set_literal
                          onPressed: () =>
                          {
                            setState(() {
                              _isloading = true;
                            }),
                          if (_formKey.currentState.validate()) {
                            handleLoginSubmit(context, usernameconroller.text,
                                passwordcontroller.text)
                          }
                          },
                          splashColor: Colors.redAccent,
                        )

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
              ),
              Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          padding: const EdgeInsets.only(
                              left: 20.0, bottom: 10.0),
                          child: Center(
                            child:Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: Colors.teal,

                              ),
                            ),
                          )
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(builder:
                                    (BuildContext context) => signUp()));

                          },
                          child: Center(
                            child: new Text("Create account",
                              style: TextStyle(
                                  color: Colors.teal
                              ),
                            ),
                          )
                      ),
                    ],
                  )
              )
            ],
          ),
        ],
      ),
    );

  }

  static Future<void> handleLoginSubmit(BuildContext context,username,pass) async {
    final GlobalKey<State> keyLoader = new GlobalKey<State>();
    try {
      Dialogs.showLoadingDialog(context, keyLoader);
      var res = await AuthLogic.signin(username,pass); //invoking login
//      print("Handlesubmit"+ email);
      print("dk");
      print(res);
      print("dk");
      if (res!="failed"){
        Navigator.of(context).pop();
        Navigator.of(context).push(
            new MaterialPageRoute(builder:
                (BuildContext context) => mainpage(logData:res["user"])));
      }else if(res=="failed"){
        Future.delayed(const Duration(milliseconds: 1000), () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder:
                  (BuildContext context) => login()));
        });
        Dialogs.showErrorDialog(context,"Wrong credentials");

        print("===============================================================================");
        print(res);
      }
    } catch (error) {
      print(error);
    }
  }

  TextEditingController usernameconroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
}


class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {

  SharedPreferences sharedpreferences;

  checkLoginStatus() async {
    sharedpreferences = await SharedPreferences.getInstance();
    if (sharedpreferences.getString("username") == null) {
      //Royte back to this page
    }
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black87, BlendMode.darken)
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Divider(
                      height: 20.0,
                    ),
                    Center(
                      child: Image(
                        image: AssetImage('assets/kag.jpeg'),
                        width: 180,
                        height: 130,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Theme(
                        data: ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.teal,
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                color: Colors.teal,
                                fontSize: 20.0,
                              )
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(35.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                controller: formControllers.firstnamecontroller,
                                decoration: InputDecoration(
                                  labelText: 'Enter firstname',
                                ),
                                validator: Validators.required(
                                    "Firstname is required"),
                                keyboardType: TextInputType.text,

                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                              ),
                              TextFormField(
                                controller: formControllers.lastnamecontroller,
                                decoration: InputDecoration(
                                  labelText: 'Enter lastname',
                                ),
                                validator: Validators.required(
                                    "Lastname is required"),
                                keyboardType: TextInputType.text,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                              ),
                              TextFormField(
                                controller: formControllers.emailcontroller,
                                decoration: InputDecoration(
                                  labelText: 'Enter email',
                                ),
                                validator: Validators.email(
                                    "Invalid email address"),
                                keyboardType: TextInputType.emailAddress,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                              ),
                              TextFormField(
                                controller: formControllers.usernameconroller,
                                decoration: InputDecoration(
                                  labelText: 'Enter Username',
                                ),
                                validator: Validators.required(
                                    'Userrname is required'),
                                keyboardType: TextInputType.text,
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                              ),
                              TextFormField(
                                controller: formControllers.passwordcontroller,
                                decoration: InputDecoration(
                                  labelText: 'Enter Password',
                                ),
                                keyboardType: TextInputType.text,
                                validator: Validators.minLength(6, "Password has to be more than 6 characters"),
                                obscureText: true,
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
                                    "CREATE ACCOUNT"

                                ),
                                // ignore: sdk_version_set_literal
                                onPressed: () =>
                                {

                                  print("Works to here"),
                                if (_formKey.currentState.validate()) {
                                  _handleSubmit(
                                      context,
                                      formControllers.usernameconroller.text,
                                      formControllers.emailcontroller.text,
                                      formControllers.passwordcontroller.text,
                                      formControllers.firstnamecontroller.text,
                                      formControllers.lastnamecontroller.text
                                  ),
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

                    Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(builder:
                                          (BuildContext context) => login()));
                                },
                                child: Center(
                                  child: Text(
                                    "Already have an account? \n Log in",
                                    style: TextStyle(
                                        color: Colors.teal
                                    ),
                                  ),
                                )
                            ),

                          ],
                        )
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
      ),
    );
  }
  static Future<void> _handleSubmit(BuildContext context,username,email,pass,first,last) async {

    final GlobalKey<State> _keyLoader = new GlobalKey<State>();
    try {
      Dialogs.showLoadingDialog(context, _keyLoader); //invoking login
      var res = await AuthLogic.signup(username,email,pass,first,last);
      print("Handlesubmit"+ email);
      print("reeeees\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
      print(res);
      print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
      if (res['Status']==200){
        Navigator.of(context).pop();
        Navigator.of(context).push(
            new MaterialPageRoute(builder:
                (BuildContext context) => mainpage(logData: res['user'],)));
      }else if(res['Status']==500){
        print("statuscode no 500");
        Future.delayed(const Duration(milliseconds: 1500), () {
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder:
                  (BuildContext context) => signUp()));
        });
        print("=======================res coming up===============================");
        print(res);
        Dialogs.showErrorDialog(context,res['user']['username'][0]);
        print("===============================================================================");
        print(res);
      }
    } catch (error) {
      print(error);
    }
  }
}

class mainpage extends StatefulWidget  {
  var logData;
  mainpage({Key key, this.logData}) : super(key: key);

  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> with AfterLayoutMixin<mainpage> {
  var user,balance;


  @override
  void afterFirstLayout(BuildContext context) async {
    // Calling the same function "after layout" to resolve the issue.

    var jsonData=null;
    var depoFinance=null;
    var response = await http.post("https://devsacco.herokuapp.com/api/getUserProfileById/",
        body:{
          "user":"${widget.logData["id"]}"
        });
    var responseBal = await http.post("https://devsacco.herokuapp.com/api/account/",
        body:{
          "id":"${widget.logData["id"]}"
        });
    jsonData=json.decode(response.body);
    depoFinance=json.decode(responseBal.body);
    setState(() {
      user=jsonData;
      balance=depoFinance;
    });
  }

  SharedPreferences sharedpreferences;
  checkLoginStatus() async {
    sharedpreferences = await SharedPreferences.getInstance();
    if(sharedpreferences.getString("username")==null){
      //Rote back to this page
    }

  }

Material myTiles(IconData icon,String title,Color color,StatefulWidget tile){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      shadowColor: Color(0x802196F3),
      borderRadius: BorderRadius.circular(24.0),
        child: InkWell(
          onTap: (){

            Navigator.of(context).push(
                new MaterialPageRoute(builder:
                    (BuildContext context) => tile));
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(title,
                          style: TextStyle(
                            color: color,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      //icon
                      Material(
                        color:color,
                        borderRadius: BorderRadius.circular(24.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            icon,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text((() {
          if(user!=null){
            return "${user['userdata']['username']}";
          }
          return "---";
        })())
      ),
      body:StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
          children: <Widget>[
            Profile(user,balance),
            myTiles(Icons.account_balance,"Loan",Colors.red,LoansPage(userData:widget.logData)),
            myTiles(Icons.input,"Deposit",Colors.green,depositsDialog(userData: widget.logData)),
            myTiles(Icons.archive,"Withdraw",Colors.blue,signUp()),
            myTiles(Icons.receipt,"Reports",Colors.orange,reports()),

          ],
        staggeredTiles: [
          StaggeredTile.extent(2, 300.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),
          StaggeredTile.extent(1, 150.0),


        ],
      ),
    );
  }


}

