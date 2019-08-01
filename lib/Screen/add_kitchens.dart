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



class AddKPage extends StatefulWidget {
  @override
  _AddKPageState createState() => _AddKPageState();
}

class _AddKPageState extends State<AddKPage> {
  final DocumentReference documentReference = Firestore.instance.document("Kitchen");
  final DatabaseReference database =FirebaseDatabase.instance.reference().child("Kitchen");

  File _image;
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _KitchennameTextController = TextEditingController();
  TextEditingController _OwnerFistnameTextController = TextEditingController();
  TextEditingController _OwnerLastnameTextController = TextEditingController();
  TextEditingController _ConinfoTextController = TextEditingController();
  TextEditingController _WebsiteURLConinfoTextController = TextEditingController();
  int groupValue;

  //============real time data ==================
  sendData(){
    database.push().set({
      "picture" : basename(_image.path),
       "Kitchen Name" : _KitchennameTextController.text,
      "Owner First Name" : _OwnerFistnameTextController.text,
      "Owner Last Name" : _OwnerLastnameTextController.text,
      "Contact Info" : _ConinfoTextController.text,
      "Email" : _emailTextController.text,
      "Website URL" : _WebsiteURLConinfoTextController.text,
    });
  }
  //=============Cloud Data==================
  createdata(){
    DocumentReference ds = Firestore.instance.collection('Kitchen').document(_KitchennameTextController.text);
    Map<String, String> kitchenData = {

      "Kitchen Name" : _KitchennameTextController.text,
      "Owner First Name" : _OwnerFistnameTextController.text,
      "Owner Last Name" : _OwnerLastnameTextController.text,
      "Contact Info" : _ConinfoTextController.text,
      "Email" : _emailTextController.text,
      "Website URL" : _WebsiteURLConinfoTextController.text,
    };
    ds.setData(kitchenData).whenComplete((){
      print("Added");
    }).catchError((e) => print(e));
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

    Future uploadPic(BuildContext context) async{
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }



    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black.withOpacity(0.8),
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Form(
                    child: ListView(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            radius: 100,
                            backgroundColor: Color(0xff476cfb),
                            child: ClipOval(
                              child: new SizedBox(
                                width: 180.0,
                                height: 180.0,
                                child: (_image!=null)?Image.file(
                                  _image,
                                  fit: BoxFit.fill,
                                ):Image.network(
                                  "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: IconButton(
                            icon: Icon(FontAwesomeIcons.camera,size: 30.0,),
                            onPressed: () {
                              getImage();
                            },
                          ),
                        ),  // ======= Image Upload Icon Button====

                        Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _KitchennameTextController,
                                decoration: InputDecoration(
                                  hintText: "Name of the Kitchen",
                                  icon: Icon(Icons.alternate_email),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _OwnerFistnameTextController,
                                decoration: InputDecoration(
                                  hintText: "Owner's First Name",
                                  icon: Icon(Icons.lock_outline),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The owner name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _OwnerLastnameTextController,
                                decoration: InputDecoration(
                                  hintText: "Owner's Last Name",
                                  icon: Icon(Icons.lock_outline),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The owner name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _ConinfoTextController,
                                decoration: InputDecoration(
                                  hintText: "Contact number",
                                  icon: Icon(Icons.lock_outline),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The Contact field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _emailTextController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.lock_outline),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The Email field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white.withOpacity(0.4),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _WebsiteURLConinfoTextController,
                                decoration: InputDecoration(
                                  hintText: "Website URL(Optional)",
                                  icon: Icon(Icons.lock_outline),
                                ),
                              ),
                            ),
                          ),
                        ),
//================Add Button======================
                        Padding(
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red.shade700,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: createdata,
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
                          padding:
                          const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.red.shade700,
                              elevation: 0.0,
                              child: MaterialButton(
                                onPressed: (){},
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

                          child: FlatButton(
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                            },
                            child: Text(
                              "Need Help",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }


}

