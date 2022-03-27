import 'dart:io';
import 'package:flutter/material.dart';
import 'create_account.dart';
import 'contact_us.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }}
class _MyHomePageState extends State<MyHomePage> {
  Image image =Image.asset('images/1.jpg');
  String title='Zita Software Co';
  String description ='Lorem  ipsum is placeholder text commaoly used in the graphic, print and publihing industries for the previewing loyouts for previewing layouts and visual mockups.';
  String phone='0912345678';
  String contact='email or any page';
//  Color color =Color(0xFF0087ff);
//Colors _colors=Colors.black);
  Color color=Color(0xFF0087ff);
  /* key to open drawer*/
  GlobalKey<ScaffoldState> _globalKey=GlobalKey<ScaffoldState>();
  TextStyle style = TextStyle(fontWeight: FontWeight.bold,fontSize: 20);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          key: _globalKey,
          backgroundColor: Colors.white,
          drawer:Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(right: 30,left: 30,top: 50),
                  title: Text(
                    'Home',
                    style: style,
                  ),
                  leading: Icon(
                    Icons.home,
                    color: color,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(right: 30,left: 30),
                  title: Text(
                    'My Ads',
                    style: style,
                  ),
                  leading: Icon(
                    Icons.list,
                    color: color,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(right: 30,left: 30),
                  title: Text(
                    'Contact As',
                    style: style,
                  ),
                  leading: Icon(
                    Icons.contact_mail,
                    color: color,
                  ),
                  onTap: () {
                    navigatorPage(context, ContactUs());
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(right: 30,left: 30),
                  title: Text(
                    'Exit',
                    style: style,
                  ),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: color,
                  ),
                  onTap: () {
                    exit(0);
                  },
                )],),
          ),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.dehaze),
              color: color,
              onPressed: (){
                _globalKey.currentState.openDrawer();
              },

            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation:0.0,
            title: Text(
              'ZADs',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color:color,),
            ),),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navigatorPage(context,LoginPage());

            }//end on
            ,
            tooltip: 'add ads',
            child: Icon(Icons.add),
            backgroundColor: color,
          ),
          // the body of Scaffold
          body:getListView()
      ),
    );
  }//end of build widget
  /*listView to show the ads as a card*/
  ListView getListView(){
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context,int position){
          return
            Padding(
                padding: EdgeInsets.only(top:10.0,left: 20,right: 20),
                child:  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(35)),
                    child:Card(
                      color: Color(0xFFe7e7ff),
                      //  color: Colors.white70,
                      borderOnForeground: true,
                      elevation: 30,
                      child: Container(
                          padding: EdgeInsets.all(15.0),
                          child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(children: <Widget>[Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)]),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Wrap(children: <Widget>[Text(description,style: TextStyle(fontSize: 17))]),
                                ),

                                getImage(position),


                                //   Image.asset('images/1.jpg'),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(children: <Widget>[Text('For more information',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))]),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child:   Row(
                                    children: <Widget>[
                                      Icon(Icons.phone,color: color,),
                                      Text('    '),

                                      GestureDetector(
                                        child:  Text(phone,style: TextStyle(fontSize: 17),),
                                        onTap: (){
                                          _launchInPhone(phone);
                                        },
                                      )
                                    ],),
                                ),
                                Padding(
                                    padding: EdgeInsets.all(5),
                                    child:   Row(
                                      children: <Widget>[
                                        Icon(Icons.email,color:color,),
                                        Text('    '),

                                        GestureDetector(
                                          child: Text(contact,style: TextStyle(fontSize: 17),),
                                          onTap: (){
                                            _launchInBrowser('https://www.google.com');
                                          },)


                                      ],
                                    )
                                ),
                              ]
                          )),
                    )
                )
            );
        }//end item
    );
  }

  /* to get image in ads if it has a image*/
  Widget getImage(int x){
    if (x==2||x==4){
      return Padding(child:image,padding: EdgeInsets.all(5),);
    }
    return Container();
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

void _launchInPhone(String phone)async{
  await launch("tel:$phone");
}
void _launchInBrowser(String url)async{
  await launch(url);
}

