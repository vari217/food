import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';



final DatabaseReference database =FirebaseDatabase.instance.reference().child("Kitchen");
sendData(){
  database.push().set({
    //"Kitchen Name" : _KitchennameTextController.text,

  });
}