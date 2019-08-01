import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'createtodo.dart';

class NewMeal extends StatefulWidget {
  NewMeal();
  @override
  _NewMealState createState() => _NewMealState();
}

class _NewMealState extends State<NewMeal> {

  //String taskname,taskdetails,taskDate,taskTime;
  String mondayMeal,tuesdayMeal,wednesdayMeal,thursdayMeal,fridayMeal,saturdayMeal,sundayMeal,KitchenName;

  getMondayMeal(mondayMeal){
    this.mondayMeal=mondayMeal;
  }
  getTuesdayMeal(tuesdayMeal){
    this.tuesdayMeal=tuesdayMeal;
  }
  getWednesdayMeal(wednesdayMeal){
    this.wednesdayMeal=wednesdayMeal;
  }
  getThursdayMeal(thursdayMeal){
    this.thursdayMeal=thursdayMeal;
  }
  getFridayMeal(fridayMeal){
    this.fridayMeal=fridayMeal;
  }
  getSaturdayMeal(saturdayMeal){
    this.saturdayMeal=saturdayMeal;
  }
  getSundayMeal(sundayMeal){
    this.sundayMeal=sundayMeal;
  }

  int _mealTimes = 0;
  String mealVal;
  void _handlemealTimes(int value) {
    setState(() {
      _mealTimes = value;
      switch (_mealTimes) {
        case 1:
          mealVal='One Time';
          break;
        case 2:
          mealVal='Two Time';
          break;
      }
    });
  }
  int _subscription = 1;
  String subVal;
  void _handlesubscription(int value) {
    setState(() {
      _subscription = value;
      switch (_subscription) {
        case 1:
          subVal='One Month';
          break;
        case 2:
          subVal='one Week';
          break;
      }
    });
  }

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    );
  }

  createData(){
    DocumentReference ds=Firestore.instance.collection('Meal').document(KitchenName);
    Map<String,dynamic> tasks={
      "Monday Meal":mondayMeal,
      "Tuesday Meal":tuesdayMeal,
      "Wednesday Meal":wednesdayMeal,
      "Thursday Meal":thursdayMeal,
      "Friday Meal":fridayMeal,
      "Saturdat Meal":saturdayMeal,
      "Sunday Meal":sundayMeal,
      "Meal Times" :_mealTimes,
    };

    ds.setData(tasks).whenComplete((){
      showInSnackBar("Meal Added");
    }).catchError((e)=>print(e));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: <Widget>[
          _myAppBar(),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 80,
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    // controller: _taskNameController,
                    onChanged: (String mMeal){
                      getMondayMeal(mMeal);
                    },
                    decoration: InputDecoration(labelText: "Monday: "),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    //controller: _taskDetailsController,
                    decoration: InputDecoration(labelText: "Tuesday: "),
                    onChanged: (String tuMeal){
                      getTuesdayMeal(tuMeal);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    // controller: _taskDateController,
                    decoration: InputDecoration(labelText: "Wednesday: "),
                    onChanged: (String wMeal){
                      getWednesdayMeal(wMeal);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    // controller: _taskTimeController,
                    decoration: InputDecoration(labelText: "Thursday: "),
                    onChanged: (String thMeal){
                      getThursdayMeal(thMeal);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    // controller: _taskTimeController,
                    decoration: InputDecoration(labelText: "Friday: "),
                    onChanged: (String fMeal){
                      getFridayMeal(fMeal);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    // controller: _taskTimeController,
                    decoration: InputDecoration(labelText: "Saturday: "),
                    onChanged: (String saMeal){
                      getSaturdayMeal(saMeal);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: TextField(
                    // controller: _taskTimeController,
                    decoration: InputDecoration(labelText: "Sunday: "),
                    onChanged: (String suMeal){
                      getSundayMeal(suMeal);
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Text(
                    'Select Meal Quantity:',
                    style:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 1,
                          groupValue: _mealTimes,
                          onChanged: _handlemealTimes,
                          activeColor: Color(0xff4158ba),
                        ),
                        Text(
                          'One Time',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 2,
                          groupValue: _mealTimes,
                          onChanged: _handlemealTimes,
                          activeColor: Color(0xfffb537f),
                        ),
                        Text(
                          'Two Time',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
      SizedBox(
        height: 10.0,
      ),
      Center(
        child: Text(
          'Select Subscription:',
          style:
          TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: _subscription,
                onChanged: _handlemealTimes,
                activeColor: Color(0xff4158ba),
              ),
              Text(
                'One Month',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                value: 2,
                groupValue: _subscription,
                onChanged: _handlemealTimes,
                activeColor: Color(0xfffb537f),
              ),
              Text(
                'One Week',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),

        ],
      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                        color: Color(0xFFFA7397),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Color(0xFFFDDE42)),
                        )),
                    // This button results in adding the contact to the database
                    RaisedButton(
                        color: Color(0xFFFA7397),
                        onPressed: () {
                          createData();
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Color(0xFFFDDE42)),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _myAppBar() {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              const Color(0xFFFA7397),
              const Color(0xFFFDDE42),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.arrowLeft,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Text(
                      'New Tasks',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}