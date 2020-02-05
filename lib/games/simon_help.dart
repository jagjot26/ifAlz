import 'package:flutter/material.dart';

class SimonHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 60, 30, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'How to Play',
              style:
                  Theme.of(context).textTheme.headline.copyWith(fontSize: 40),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text('''1. Wait for a button to light up.''',
                style:
                    Theme.of(context).textTheme.body1.copyWith(fontSize: 20)),
            Text('''2. Tap the button that just lit up.''',
                style:
                    Theme.of(context).textTheme.body1.copyWith(fontSize: 20)),
            Text('''3. Wait for the next button to light up.''',
                style:
                    Theme.of(context).textTheme.body1.copyWith(fontSize: 20)),
            Text('''4. Tap the two buttons in the sequence that they lit up.''',
                style:
                    Theme.of(context).textTheme.body1.copyWith(fontSize: 20)),
            Text(
                '''5. The game will continue similarly for a few levels until the user messes up or clears all the levels.''',
                style:
                    Theme.of(context).textTheme.body1.copyWith(fontSize: 20)),
            Text(
                '''6. If you're able to advance to level 7, you can proceed to the next game in the test if you like.''',
                style:
                    Theme.of(context).textTheme.body1.copyWith(fontSize: 20)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/nintendo_2x.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
