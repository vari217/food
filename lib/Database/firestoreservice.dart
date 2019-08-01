import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore_cloud.dart';

final CollectionReference myCollection = Firestore.instance.collection('todolist');

class FirestoreService {

  Future<Meal> createTask(String mondayMeal, String tuesdayMeal, String wednesdayMeal, String thursdayMeal, String fridayMeal,
      String saturdayMeal,  String sundayMeal,) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.document());

      final Meal meal = new Meal(mondayMeal,tuesdayMeal,wednesdayMeal,thursdayMeal,fridayMeal,saturdayMeal,sundayMeal);
      final Map<String, dynamic> data = meal.toMap();
      await tx.set(ds.reference, data);
      return data;
    };


    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Meal.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getTaskList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }


}