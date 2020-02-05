import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:if_alz/game_choose.dart';
import 'package:if_alz/games/celebrity.dart';
import 'package:if_alz/games/pattern2.dart';
import 'package:if_alz/sign_in_screen.dart';
import 'package:if_alz/choice.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

SharedPreferences sharedPrefs;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      setState(() => sharedPrefs = prefs);
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        accentColor: Colors.blue[700],
        fontFamily: 'Lato',
        textTheme: TextTheme(
          //default text style
          headline: TextStyle(
              fontSize: 60.0,
              fontWeight: FontWeight.w900,
              fontFamily: 'Montserrat'),
          title: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 21.0,
          ),
          body1: TextStyle(
              color: Colors.black, fontFamily: 'Quicksand', fontSize: 17),
        ),
      ),
      home: (isLoading) ? CircularProgressIndicator() : _getLandingPage(),
    );
  }
}

Widget _getLandingPage() {
  if (sharedPrefs.getString('signedIn') == null ||
      sharedPrefs.getString('signedIn') == '0') {
    return SignInScreen();
  }
  if (sharedPrefs.getString('signedIn') == 'yes') {
    String uid = sharedPrefs.getString('uid');
    return ChoiceScreen();
  }

  return CircularProgressIndicator();
  // or some other widget
}
