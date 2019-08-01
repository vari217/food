import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';

import 'Home.dart';

enum MealOffered { One, Two }
enum NoticePeriod { one_day, Two_day}

class AddMealPage extends StatefulWidget {

  @override
  _AddMealPageState createState() => _AddMealPageState();

}



class _AddMealPageState extends State<AddMealPage> {
  NoticePeriod _noticePeriod = NoticePeriod.Two_day;
  MealOffered _mealOffered = MealOffered.One;
  File _image;
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _KnameTextController = TextEditingController();
  TextEditingController _OnameTextController = TextEditingController();
  TextEditingController _ConinfoTextController = TextEditingController();
  String Email,KitchenName,OwnerFirstName,OwnerLastName,ContactInfo,WebsiteURL;
  int groupValue;
  final _formKey = GlobalKey<FormState>();
  bool _value1 = false;
  bool _value2 = false;

  void _onChanged1(bool value) => setState(() => _value1 = value);
  void _onChanged2(bool value) => setState(() => _value2 = value);



  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }


    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
            }),
        title: Text('Add Meal Plans'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blueAccent.withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(

              child: Center(
                child: Form(
                    child: ListView(padding: EdgeInsets.only(bottom: 50.0),
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 16.0),
                        child: Builder(
                            builder: (context) => Form(
                                key: _formKey,
                         child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                         children: [
                           Container(
                             padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                             child: Text('Meal Plan', style: TextStyle(color: Colors.black,fontSize: 20.0,fontStyle:FontStyle.italic),),
                           ),

                           ListTile(

                             subtitle:  Container(
                                 child: _image != null ? new Container(
                                   child: new SizedBox(
                                     width: 80.0,
                                     height: 100.0,
                                     child: (_image!=null)?Image.file(
                                       _image,
                                       fit: BoxFit.fill,
                                     ):null
                                   ),
                                 ) : new Container(
                                   child: Text("upload Photo"),
                                 )
                             ),
                             title: new TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: "Monday Meal",

                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(icon: Icon(
                                FontAwesomeIcons.camera, size: 30.0,
                               ),
                                onPressed: () {
                                   getImage();
                                  },),
                                ),

                           ListTile(
                             subtitle:  Container(
                                 child: _image != null ? new Container(
                                   child: new SizedBox(
                                       width: 80.0,
                                       height: 100.0,
                                       child: (_image!=null)?Image.file(
                                         _image,
                                         fit: BoxFit.fill,
                                       ):null
                                   ),
                                 ) : new Container(
                                   child: Text("upload Photo"),
                                 )
                             ),
                             title: new TextFormField(
                               controller: _emailTextController,
                               decoration: InputDecoration(
                                 hintText: "Tuesday Meal",

                               ),
                               validator: (value) {
                                 if (value.isEmpty) {
                                   return "The name field cannot be empty";
                                 }
                                 return null;
                               },
                             ),
                             trailing: IconButton(icon: Icon(
                               FontAwesomeIcons.camera, size: 30.0,
                             ),
                               onPressed: () {
                                 getImage();
                               },),
                           ),

                           ListTile(
                             subtitle:  Container(
                                 child: _image != null ? new Container(
                                   child: new SizedBox(
                                       width: 80.0,
                                       height: 100.0,
                                       child: (_image!=null)?Image.file(
                                         _image,
                                         fit: BoxFit.fill,
                                       ):null
                                   ),
                                 ) : new Container(
                                   child: Text("upload Photo"),
                                 )
                             ),
                             title: new TextFormField(
                               controller: _emailTextController,
                               decoration: InputDecoration(
                                 hintText: "Wednesday Meal",

                               ),
                               validator: (value) {
                                 if (value.isEmpty) {
                                   return "The name field cannot be empty";
                                 }
                                 return null;
                               },
                             ),
                             trailing: IconButton(icon: Icon(
                               FontAwesomeIcons.camera, size: 30.0,
                             ),
                               onPressed: () {
                                 getImage();
                               },),
                           ),

                           ListTile(
                             subtitle:  Container(
                                 child: _image != null ? new Container(
                                   child: new SizedBox(
                                       width: 80.0,
                                       height: 100.0,
                                       child: (_image!=null)?Image.file(
                                         _image,
                                         fit: BoxFit.fill,
                                       ):null
                                   ),
                                 ) : new Container(
                                   child: Text("upload Photo"),
                                 )
                             ),
                             title: new TextFormField(
                               controller: _emailTextController,
                               decoration: InputDecoration(
                                 hintText: "Thursday Meal",

                               ),
                               validator: (value) {
                                 if (value.isEmpty) {
                                   return "The name field cannot be empty";
                                 }
                                 return null;
                               },
                             ),
                             trailing: IconButton(icon: Icon(
                               FontAwesomeIcons.camera, size: 30.0,
                             ),
                               onPressed: () {
                                 getImage();
                               },),
                           ),

                           ListTile(

                             title: new TextFormField(
                               controller: _emailTextController,
                               decoration: InputDecoration(
                                 hintText: "Friday Meal",

                               ),
                               validator: (value) {
                                 if (value.isEmpty) {
                                   return "The name field cannot be empty";
                                 }
                                 return null;
                               },
                             ),
                             trailing: IconButton(icon: Icon(
                               FontAwesomeIcons.camera, size: 30.0,
                             ),
                               onPressed: () {
                                 getImage();
                               },),
                           ),

                           ListTile(

                             title: new TextFormField(
                               controller: _emailTextController,
                               decoration: InputDecoration(
                                 hintText: "saturday Meal",
                               ),

                             ),
                             trailing: IconButton(icon: Icon(
                               FontAwesomeIcons.camera, size: 30.0,
                             ),
                               onPressed: () {
                                 getImage();
                               },),
                           ),

                           ListTile(

                             title: new TextFormField(
                               controller: _emailTextController,
                               decoration: InputDecoration(
                                 hintText: "Sunday Meal",

                               ),

                             ),
                             trailing: IconButton(icon: Icon(
                               FontAwesomeIcons.camera, size: 30.0,
                             ),
                               onPressed: () {
                                 getImage();
                               },),
                           ),





                      Container(
                     padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                      child: Text('Subscribe', style: TextStyle(color: Colors.black,fontSize: 20.0,fontStyle:FontStyle.italic),),
                      ),

                      SwitchListTile(
                                          title: const Text('Weekly Service'),
                                          value: _value1,
                                          onChanged: (bool val) => setState(
                                              () => _value1 = val)),
                       SwitchListTile(
                                          title: const Text('Monthly Service'),
                                          value: _value2,
                                          onChanged: (bool val) => setState(
                                                  () => _value2 = val)),
                                      //===================================radio button================
                      Container(
                                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                                        child: Text('Meals Available'),
                                      ),
                      Column(
                                        children: <Widget>[
                                          RadioListTile<MealOffered>(
                                            title: const Text('One Time Meal'),
                                            value: MealOffered.One,
                                            groupValue: _mealOffered,
                                            onChanged: (MealOffered value) { setState(() { _mealOffered = value; }); },
                                          ),
                                          RadioListTile<MealOffered>(
                                            title: const Text('Ywo Time Meal'),
                                            value: MealOffered.Two,
                                            groupValue: _mealOffered,
                                            onChanged: (MealOffered value) { setState(() { _mealOffered = value; }); },
                                          ),
                                        ],
                                      ),
                      Container(
                                        padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                                        child: Text('Notice Period'),
                                      ),
                       Column(
                        children: <Widget>[
                         RadioListTile<NoticePeriod>(
                                            title: const Text('One Time Meal'),
                                            value: NoticePeriod.one_day,
                                            groupValue: _noticePeriod,
                                            onChanged: (NoticePeriod value) { setState(() { _noticePeriod = value; }); },
                                          ),
                          RadioListTile<NoticePeriod>(
                                            title: const Text('Ywo Time Meal'),
                                            value: NoticePeriod.Two_day,
                                            groupValue: _noticePeriod,
                                            onChanged: (NoticePeriod value) { setState(() { _noticePeriod = value; }); },
                                          ),
                          ],
                        ),
              ])))),


//================Add Button======================
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red.shade700,
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Add",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          )),
                    ),
//============Cancel button===================
                    Padding(
                      padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                      child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red.shade700,
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                              "Cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),
                            ),
                          )),
                    ),
//================="Need Help"==========
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Need Help",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )),
              ),

          ),
        ],
      ),
    );
  }
}
