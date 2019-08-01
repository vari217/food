class Meal{
  String _mondayMeal;
  String _tuesdayMeal;
  String _wednesdayMeal;
  String _thursdayMeal;
  String _fridayMeal;
  String _saturdayMeal;
  String _sundayMeal;

  Meal(this._mondayMeal,this._tuesdayMeal,this._wednesdayMeal,this._thursdayMeal,this._fridayMeal,this._saturdayMeal,this._sundayMeal);

  Meal.map(dynamic obj){
    this._mondayMeal = obj['mondayMeal'];
    this._tuesdayMeal = obj['tusdayMeal'];
    this._wednesdayMeal = obj['wednesdayMaal'];
    this._thursdayMeal = obj['thursdayMeal'];
    this._fridayMeal = obj['fridayMeal'];
    this._saturdayMeal =obj['saturdayMeal'];
    this._sundayMeal =obj['sundayMeal'];
  }

  String get  mondayMeal=> _mondayMeal;
  String get tuesdayMeal => _tuesdayMeal;
  String get wednesdayMeal => _wednesdayMeal;
  String get thursdayMeal => _thursdayMeal;
  String get fridayMeal => _fridayMeal;
  String get saturdayMeal => _saturdayMeal;
  String get sundayMeal => _sundayMeal;

  Map<String,dynamic> toMap(){
    var map=new Map<String,dynamic>();
    map['mondayMeal']=_mondayMeal;
    map['tuesdayMeal'] = _tuesdayMeal;
    map['wednesdayMeal'] = _wednesdayMeal;
    map['thursdayMeal'] = _thursdayMeal;
    map['fridayMeal'] = _fridayMeal;
    map['saturdaydayMeal'] = _saturdayMeal;
    map['sundayMeal'] = _sundayMeal;
    return map;
  }

  Meal.fromMap(Map<String,dynamic> map){
    this._mondayMeal= map['mondayMeal'];
    this._tuesdayMeal = map['tuesdayMeal'];
    this._wednesdayMeal = map['wednesdayMeal'];
    this._thursdayMeal = map['thursdayMeal'];
    this._fridayMeal = map['fridayMeal'];
    this._saturdayMeal = map['saturdayMeal'];
    this._sundayMeal = map['sundayMeal'];
  }
}