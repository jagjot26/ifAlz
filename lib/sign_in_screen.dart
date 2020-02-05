import 'package:flutter/material.dart';
import 'dart:async';
// import 'startscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:if_alz/info.dart';
import 'package:if_alz/progress.dart';
import 'package:if_alz/choice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInScreen extends StatefulWidget {
  static final id = "SignInScreen";
  final bool isOwner;

  SignInScreen({this.isOwner});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    isLoading = false;
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn(BuildContext context) async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    setState(() {
      isLoading = true;
    });
    final prefs = await SharedPreferences.getInstance();
    final FirebaseUser firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;
    print("signed in " + firebaseUser.displayName);

    if (firebaseUser != null) {
      // Check is already sign up

      final QuerySnapshot result = await Firestore.instance
          .collection('users')
          .where('uid', isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        // Update data to server if new user
        Firestore.instance
            .collection('users')
            .document(firebaseUser.uid)
            .setData({
          'name': firebaseUser.displayName,
          'image': firebaseUser.photoUrl,
          'uid': firebaseUser.uid,
        });
      }

      Fluttertoast.showToast(msg: "Sign in success");

      prefs.setString('signedIn', 'yes');
      prefs.setString('uid', firebaseUser.uid);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ChoiceScreen()),
          (Route<dynamic> route) => false);
    } else {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: "Sign in failed");
    }
    return firebaseUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.height * 0.045,
            MediaQuery.of(context).size.height * 0.1,
            MediaQuery.of(context).size.height * 0.045,
            MediaQuery.of(context).size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: <Widget>[
              Text(
                "If-Alz",
                textAlign: TextAlign.start,
                style:
                    Theme.of(context).textTheme.headline.copyWith(fontSize: 50),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoPage(),
                    ),
                  );
                },
                child: Icon(
                  Icons.info,
                  color: Color(0xff012E8D),
                  size: 33,
                ),
              ),
            ]),
            Text(
              "Let's play some games to put your memory to test. Go ahead and sign in to start!",
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.black54),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.044,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/NICEPNG.png'), fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.039,
            ),
            GestureDetector(
              onTap: () => _handleSignIn(context),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: isLoading
                      ? CircleAvatar(
                          child: spinkit(),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.height * 0.05,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('images/google.png'),
                                fit: BoxFit.cover),
                          ),
                        ),
                  title: Text(
                    "Sign in with Google",
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
