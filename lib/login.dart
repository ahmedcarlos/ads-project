import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'create_account.dart';
import 'ads_detail.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  //orange color
  Color color=Color(0xFF0087ff);
  //   /toggle show and not show the password
  bool toggle1 =true;
  Icon icon1=Icon(Icons.visibility,color: Color(0xFF0087ff),);
  //Controller of all text field to validator on submit
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  //index of bottomNavigationBar
  var value=0;
  // GlobalKey of form
  var _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

  bool loading = false;
  var data = {
    "phone": "",
    "password": ""
  };
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return  Scaffold(
      key: _scaffold,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: color,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
      backgroundColor: Colors.white,
      body: Container(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.only(left: 20,right: 20,),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                // the title
                Container(
                  width: width,
                  height: height*.3,
                  child: Center(
                    child: Text('ZADS',
                      style: TextStyle(
                          fontSize: 100,
                          color: color),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                ////////
                //email TextField
                Padding(padding: EdgeInsets.all(20),),
                ClipRRect(
                  borderRadius: BorderRadius.circular(17.5),
                  child: Center(
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        // ignore: missing_return
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'please Enter your phone number';
                          }
                        },
                        controller: phoneController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            labelText: 'phone number',
                            hintText: 'Enter your your phone number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      )
                  ),
                ),
                /////////////////
                //password TextField
                SizedBox(height: height*.02,),
                Container(
                  height: height*.13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.5),
                    child: Center(
                      child: TextFormField(
                        obscureText: toggle1,
                        controller: passwordController,
                        // ignore: missing_return
                        validator: (String value) {
                          if (value.isEmpty ||
                              passwordController.text.length < 8) {
                            return 'please Enter your password 8 letter or more';
                          }
                        },
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: icon1,
                              onPressed: (){
                                setState(() {
                                  togglePassword1();
                                });
                              },
                            ),
                            icon: Icon(Icons.contacts),
                            labelText: 'Password',
                            hintText: 'Enter The Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      )),
                    ),
                  ),
                SizedBox(height: height*.02,),
                /////////////////////
                // the validate Button
                SizedBox(
                  width: width*.9,
                  height: 65,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: RaisedButton(
                        color: color,
                        textColor: Colors.white,
                        child:  Text(
                          'Login',
                          style: TextStyle(
                               fontSize: 30),
                        ),
                        elevation: 1,
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState.validate()) {
                              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>AdsDetail(),));

                            }
                          });
                        },
                      )),
                ),
                //////////////
                SizedBox(height: 25,),
                //////////////
                SizedBox(
                  width: width*.9,
                  height: height*.05,
                  child: Center(
                    child: Text('OR',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          color: color
                      ),),
                  ),
                ),
                //////////////////////
                SizedBox(
                  width: width*.9,
                  height: height*.05,
                  child: GestureDetector(
                    onTap: (){
                     Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) =>CreateAccount(),));
                    },
                    child: Center(
                      child: Text('create new account ',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            decoration: TextDecoration.underline
                        ),),
                    ),
                  ),
                ),
                ///////////////
              ],
            ),
          ),
        ),
      ),

      ////////////////
      //bottomNavigationBar
      /*
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 3,
                        color: color
                    )
                )
            ),
            child: BottomNavigationBar(
              currentIndex: value,
              onTap: (int value){
                setState(() {
                  this.value=value;
                });
              },
//selectedLabelStyle: TextStyle(color: Colors.blue),
              selectedFontSize: 0,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              items:[
                BottomNavigationBarItem(
                    icon: IconButton(icon: Icon(Icons.local_grocery_store,color: color,size: 35,),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>ShoppingCart(),
                        ));
                      },
                    ),
                    title: Text('')
                ),
                BottomNavigationBarItem(
                    icon: IconButton(icon: Icon(Icons.favorite,color: color,size: 35,),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>Favorite(),
                        ));
                      },
                    ),
                    title: Text('')
                ),
                BottomNavigationBarItem(
                    icon: IconButton(icon: Icon(Icons.home,color: color,size: 35,),
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>MyHomePage(),
                        ));
                      },
                    ),
                    title: Text('')
                ),
                BottomNavigationBarItem(
                    icon: CircleAvatar(
                      backgroundColor: Colors.deepOrange.withOpacity(.5),
                      child: Icon(Icons.person,color: Colors.deepOrange,size: 35,),
                    ),
                    title: Text('')
                ),
              ],

            ),
          ),
          */

    );
  }
  /*to toggle show and not show the password*/
  void togglePassword1() {
    if (toggle1) {
      toggle1 = false;
      icon1 = Icon(Icons.visibility_off);
    } else {
      toggle1 = true;
      icon1 = Icon(Icons.visibility);
    }
  }
}