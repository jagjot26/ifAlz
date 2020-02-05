import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:if_alz/progress.dart';
import 'package:if_alz/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game_choose.dart';
import 'games/simon.dart';

class ChoiceScreen extends StatefulWidget {
  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  bool isLoading = false;

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

//SIGN OUT
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<Null> handleSignOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('signedIn', '0');

    setState(() {
      isLoading = true;
    });
    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => SignInScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.height * 0.045,
            MediaQuery.of(context).size.height * 0.1,
            MediaQuery.of(context).size.height * 0.045,
            MediaQuery.of(context).size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Take a pick!",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(fontSize: 39, color: Colors.blueGrey[600]),
            ),
            // Text(
            //   "Let's play some games to put your memory to test. Go ahead and sign in to start!",
            //   style: Theme.of(context)
            //       .textTheme
            //       .title
            //       .copyWith(color: Colors.black54),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.044,
            ),
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameChoose(),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0),
                    ),
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      title: Text(
                        "Play mini games",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SimonGame(),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0),
                    ),
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      title: Text(
                        "Take the full test",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .body1
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/gamer.gif'), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.037,
            ),
            GestureDetector(
              onTap: () => handleSignOut(),
              child: isLoading
                  ? CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent,
                      child: spinkit(),
                    )
                  : Icon(
                      AntDesign.logout,
                      color: Colors.black,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
