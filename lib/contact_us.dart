import 'package:flutter/material.dart';
class ContactUs extends StatefulWidget {
  @override
  ContactUsState createState() {
    return ContactUsState();
  }
}
class ContactUsState extends State<ContactUs> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  var _formKey = GlobalKey<FormState>();
  Color color=Color(0xFF0087ff);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width/17;
    var screenHeight = MediaQuery.of(context).size.height/11;
    TextStyle style = TextStyle(fontWeight: FontWeight.bold,fontSize: 18);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'Contact Us',
              style: TextStyle(
                  color:color,
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
            ),
            elevation: 0.0,),
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
                        top:screenHeight,
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
                          icon: Icon(Icons.contacts),
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
                        right: screenWidth),
                    child: TextFormField(
                      maxLines: 10,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'please Enter your Message';
                        }
                      },
                      controller: messageController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.message),
                          labelText: 'Your Message',
                          hintText: 'Enter your Message here',
                          labelStyle: style,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight,
                        left: screenWidth,
                        right:screenWidth
                        ,bottom: 5),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: RaisedButton(
                          padding: EdgeInsets.all(10),
                          color:color,
                          textColor: Colors.white,
                          child: Text(
                            'Send',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          elevation: 5,
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                AlertDialog alertDialog = AlertDialog(
                                  title: Text('message :-'),
                                  content: Text(
                                      'your Message is send successfully to Admin'),
                                );
                                showDialog(
                                    context: context,
                                    builder: (_) => alertDialog);
                              }
                            });
                          },
                        )))
              ],
            ),
          ),
        ));
  }
}
