import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class AdsDetail extends StatefulWidget {
  @override
  AdsDetailState createState() {
    return AdsDetailState();
  }
}
class AdsDetailState extends State<AdsDetail> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  int groupValue = 0;
  var _formKey = GlobalKey<FormState>();
  var imageFile;
  Color color=Color(0xFF0087ff);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width/17;
    var screenHeight = MediaQuery.of(context).size.height/20;
    TextStyle style = TextStyle(fontWeight: FontWeight.bold,fontSize: 18,);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                'Ads Detail',
                style: TextStyle(
                    color:color,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
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
                    padding: EdgeInsets.only(top: screenHeight,left: screenWidth,right: screenWidth),
                    child: TextFormField(
                      controller: titleController,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'please Enter your Ads title';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Ads title',
                          hintText: 'Enter The Ads title',
                          labelStyle: style,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: screenHeight,left: screenWidth,right: screenWidth),
                    child: TextFormField(
                      controller: typeController,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'please Enter your Ads type';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Ads type',
                          hintText: 'Enter The Ads type',
                          labelStyle: style,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25))),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight,left: screenWidth,right: screenWidth),
                  child: Row(
                    children: <Widget>[
                      imageView(),
                      RaisedButton(
                        onPressed: () {
                          showChoiceDialog(context);
                        },
                        child: Text('Choose image'),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: screenHeight,left: screenWidth,right: screenWidth),
                    child: TextFormField(
                      maxLines: 3,
                      controller: descriptionController,
                      // ignore: missing_return
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'please Enter your Description';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Ads Description',
                          hintText: 'Enter The Ads Description',
                          labelStyle: style,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: screenHeight,left: screenWidth,right: screenWidth),
                    child:  Text('Ad duration :',style: style,)),
                Padding(
                  padding: EdgeInsets.only(top: screenHeight),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: RadioListTile(
                            activeColor: color,
                            value: 0,
                            groupValue: groupValue,
                            title: Text(
                              '24 H',
                              style: style,
                            ),
                            onChanged: radioChecked,
                          )),
                      Expanded(
                          child: RadioListTile(
                            activeColor: color,
                            value: 1,
                            groupValue: groupValue,
                            title: Text(
                              '48 H',
                              style: style,
                            ),
                            onChanged: radioChecked,
                          )
                      ),
                      Expanded(
                          child: RadioListTile(
                            activeColor: color,
                            value: 2,
                            groupValue: groupValue,
                            title: Text(
                              '72 H',
                              style: style,
                            ),
                            onChanged: radioChecked,
                          )
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: screenHeight,left: screenWidth,right: screenWidth),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: RaisedButton(
                          padding: EdgeInsets.all(10),
                          color: color,
                          textColor: Colors.white,
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          elevation: 1,
                          onPressed: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                AlertDialog alertDialog = AlertDialog(
                                  title: Text('message :-'),
                                  content: Text(
                                      'your Order is send successfully to Admin'),
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
        )
    );
  }//end of build widget
  /*to toggle show the image or show text*/
  Widget imageView() {
    if (imageFile == null)
      return Text('this is image');
    else
      return Image.file(imageFile, width: 100, height: 75);
  }
/*to get image from Gallery*/
  final _picker = ImagePicker();
  openGallery(BuildContext context) async {

    var  picture = await _picker.getImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }
/*to get image from camera*/
  openCamera(BuildContext context) async {
    var picture = await _picker.getImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }
/*to show scroll dialog with to child camera and gallery */
  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('chosse'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    GestureDetector(
                      child: Text('Gallery'),
                      onTap: () {
                        openGallery(context);
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    GestureDetector(
                      child: Text('Camera'),
                      onTap: () {
                        openCamera(context);
                      },
                    ),
                  ],
                ),
              ));
        });
  }
  /*  to toggle the checked*/
  void radioChecked(int val) {
    setState(() {
      groupValue = val;
    });
  }
}//end of class
