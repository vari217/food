import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'Home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

enum MealOffered { One, Two }
enum NoticePeriod { one_day, Two_day}

class EditKitchenPage extends StatefulWidget {

  @override
  _EditKitchenPageState createState() => _EditKitchenPageState();

}



class _EditKitchenPageState extends State<EditKitchenPage> {
  NoticePeriod _noticePeriod = NoticePeriod.Two_day;
  MealOffered _mealOffered = MealOffered.One;
  File _image;
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _KnameTextController = TextEditingController();
  TextEditingController _OnameTextController = TextEditingController();
  TextEditingController _ConinfoTextController = TextEditingController();
  int groupValue;
  final _formKey = GlobalKey<FormState>();
  bool _value1 = false;
  bool _value2 = false;

  void _onChanged1(bool value) => setState(() => _value1 = value);
  void _onChanged2(bool value) => setState(() => _value2 = value);


  createdata(){
    DocumentReference ds = Firestore.instance.collection('Kichen').document(_KnameTextController.text);
    Map<String, dynamic> kitchenData = {
      "picture" : basename(_image.path),

      "Contact Info" : _ConinfoTextController.text,
      "Email" : _emailTextController.text,
    };
    ds.setData(kitchenData).whenComplete((){
      print("Added");
    });
  }

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
        title: Text('Edit Kitchen'),
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
                                          title: new TextFormField(
                                            controller: _emailTextController,
                                            decoration: InputDecoration(
                                              hintText: "Kitchen Name",
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "The name field cannot be empty";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: new TextFormField(
                                            controller: _emailTextController,
                                            decoration: InputDecoration(
                                              hintText: "Owner First Name",
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "The name field cannot be empty";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: new TextFormField(
                                            controller: _emailTextController,
                                            decoration: InputDecoration(
                                              hintText: "Owner Last Name",
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "The name field cannot be empty";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: new TextFormField(
                                            controller: _emailTextController,
                                            decoration: InputDecoration(
                                              hintText: "Contact Info",
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "The name field cannot be empty";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: new TextFormField(
                                            controller: _emailTextController,
                                            decoration: InputDecoration(
                                              hintText: "Email",
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "The name field cannot be empty";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        ListTile(
                                          title: new TextFormField(
                                            controller: _emailTextController,
                                            decoration: InputDecoration(
                                              hintText: "Website URL",
                                            ),
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "The name field cannot be empty";
                                              }
                                              return null;
                                            },
                                          ),
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
                                "Edit",
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
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
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
