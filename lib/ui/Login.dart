import 'package:flutter/material.dart';
import 'Authentication.dart';


class LoginRegisterPage extends StatefulWidget {
  LoginRegisterPage({
    this.auth,
    this.onSignedIn, onSignedOut,
});
  final AuthImplemention auth;
  final VoidCallback onSignedIn;
    State<StatefulWidget> createState()
    {
      return _LoginRegisterPageState();
    }
}

enum FormType
{
  login,
  register,
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email ="";
  String _password ="";
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate())
      {
        form.save();
        return true;
      }else
        {
          return false;
        }
  }

  void validateAndSubmit() async  {
    if(validateAndSave())
      {
        try{
            if(_formType == FormType.login)
              {
                  String userId = await widget.auth.SignIn(_email, _password);
                  print("login User Id is " + userId);
              }else{
              String userId = await widget.auth.SignUp(_email, _password);
              print("register Button Pressed");
              print("Register User Id " + userId);
            }
          widget.onSignedIn();
        }
        catch(e){
          print("Error" + e.toString());
        }
      }

  }

  void moveToRegister()  {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin()  {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("TexT"),


      ),
      body:  new Container(
        margin: EdgeInsets.all(15.0),
        child: new Form(
          key: formKey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createInputs() + createButtons(),
          ),
        ),
      ),
    );
  }

List<Widget> createInputs()
{
  return[
     SizedBox(height: 10.0,),
    logo(),
    SizedBox(height: 10.0,),
    new TextFormField(
      decoration: new InputDecoration(labelText: 'Email'),
      validator: (value){
        return value.isEmpty ? 'Email Required' : null;
      },
      onSaved: (value){
        return _email = value;
      },
    ),
 SizedBox(height: 10.0,),
new TextFormField(
decoration: new InputDecoration(labelText: 'Password'),
  obscureText: true,
  validator: (value){
    return value.isEmpty ? 'Password Required' : null;
  },
  onSaved: (value){
    return _password = value;
  },
  ),
    SizedBox(height: 20.0,),

  ];
}
 Widget logo()
 {
   return Hero(
     tag: 'hero',
     child: new CircleAvatar(
       backgroundColor: Colors.blueGrey,
       radius: 110.0,
       child: Image.network('https://firebirdsql.org/file/about/firebird-logo-300.png'),
     ),
   );
 }
  List<Widget> createButtons()
  {
    if(_formType == FormType.login)
      {
        return[
          SizedBox(height: 10.0,),
          new RaisedButton(
            child: new Text("Login", style: new TextStyle(fontSize: 20.0),),
            textColor: Colors.deepOrange,
            onPressed: validateAndSubmit,
          ),
          new FlatButton(
            child: new Text("No Account"),
            onPressed: moveToRegister,
          )

        ];
      }else {
      return[
        SizedBox(height: 10.0,),
        new RaisedButton(
          child: new Text("Register", style: new TextStyle(fontSize: 20.0),),
          textColor: Colors.deepOrange,
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text("Already Registered"),
          onPressed: moveToLogin,
        )

      ];
    }
  }
}
