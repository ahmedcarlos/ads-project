import 'package:flutter/material.dart';
import 'ads_detail.dart';
class CreateAccount extends StatefulWidget {
  @override
  CreateAccountState createState() {
    return CreateAccountState();
  }
}
class CreateAccountState extends State<CreateAccount> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  Color color=Color(0xFF0087ff);
  var _formKey = GlobalKey<FormState>();
  bool toggle1 =true;
  Icon icon1=Icon(Icons.visibility);
  bool toggle2 =true;
  Icon icon2=Icon(Icons.visibility);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width/17;
    var screenHeight = MediaQuery.of(context).size.height/20;
    TextStyle style = TextStyle(fontWeight: FontWeight.bold,fontSize: 18);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                'Creat Account',
                style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: color,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )),
          body: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight,
                        left: screenWidth,
                        right: screenWidth),
                    child: TextFormField(
                      controller: fullNameController,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'please Enter your full name';
                        }
                      },
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Full name',
                          hintText: 'Enter your your full name',
                          labelStyle: style,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight,
                        left: screenWidth,
                        right: screenWidth),
                    child: TextFormField(
                      controller: userNameController,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'please Enter your user name';
                        }
                      },
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'User name',
                          hintText: 'Enter your your user name',
                          labelStyle: style,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight,
                        left: screenWidth,
                        right: screenWidth),
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
                          labelStyle: style,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight,
                        left: screenWidth,
                        right: screenWidth),
                    child: TextFormField(
                      obscureText: toggle2,
                      showCursor: false,
                      controller: passwordConfirmationController,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty || passwordController.text != passwordConfirmationController.text) {
                          return 'please Enter the same password';
                        }
                      },
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                togglePassword2();
                              });
                            },
                            icon: icon2,
                          ),
                          icon: Icon(Icons.contacts),
                          labelText: 'Password Confirmation',
                          hintText: 'Enter The Password',
                          labelStyle: style,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight,
                        left: screenWidth,
                        right: screenWidth),
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
                          labelStyle: style,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight,
                        left: screenWidth,
                        right: screenWidth),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,

                      controller: emailController,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'please Enter your email';
                        }
                      },
                      decoration: InputDecoration(
                          icon: Icon(Icons.contact_mail),
                          labelText: 'Email',
                          hintText: 'Enter your Email',
                          labelStyle: style,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight,
                        left: screenWidth,
                        right: screenWidth,
                        bottom: screenHeight),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: RaisedButton(
                          padding: EdgeInsets.all(10),
                          color: color,
                          textColor: Colors.white,
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          elevation: 1,
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate())
                                navigatorPage(context, AdsDetail());
                            });
                          },
                        )))
              ],
            ),
          ),
        )
    );
  }//end of build widget

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
  /*to toggle show and not show the password*/
  void togglePassword2() {
    if(toggle2){
      toggle2=false;
      icon2=Icon(Icons.visibility_off);
    }
    else{
      toggle2=true;
      icon2=Icon(Icons.visibility);
    }
  }
}//end of class
/* to navigator page to page with  Animation*/
navigatorPage (BuildContext context,Widget page){
  return  Navigator.push(context,
      PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secAnimation,
              Widget child
              ){
            animation=CurvedAnimation(parent: animation,curve:Curves.elasticInOut);
            return ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: child,
            );
          },
          pageBuilder:(
              BuildContext context,
              Animation<double> animation,
              Animation<double>secAnimation
              ){
            return page;
          }
      ));
}