import 'package:flutter/material.dart';
//import '../ui/Login.dart';
import '../ui/login_page.dart';
import 'package:flutter_zone_food_amin_panel/ui/Home.dart';
import '../ui/Authentication.dart';


class MappingPage extends StatefulWidget
{
  final AuthImplemention auth;

  MappingPage
      ({
        this.auth,
      });

 State<StatefulWidget> createState()
 {
    return _MappingPageState();
 }
}

enum AuthStatus
{
  notSignedIn,
  signedIn,
}

class _MappingPageState extends State<MappingPage>
{
  AuthStatus authStatus = AuthStatus.notSignedIn;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.auth.gerCurrentUser().then((firebaseUserId)
    {
      setState(() {
        authStatus = firebaseUserId ==  null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn()
  {
    setState(() {
      authStatus = AuthStatus.signedIn;

    });
  }

  void _signedOut()
  {
    setState(() {
      authStatus = AuthStatus.notSignedIn;

    });
  }

  @override
 Widget build(BuildContext context) {
    // TODO: implement build
    switch(authStatus)
    {
      case AuthStatus.notSignedIn:
          return LoginRegisterPage
            (
              auth: widget.auth,
            onSignedIn: _signedIn,
          );
      case AuthStatus.signedIn:
      return LoginRegisterPage
        (
        auth: widget.auth,
        onSignedOut: _signedOut,
      );
    }

    return null;
  }
}