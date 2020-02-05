import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Alzheimer's",
                textAlign: TextAlign.center,
                style:
                    Theme.of(context).textTheme.headline.copyWith(fontSize: 40),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                'About',
                style:
                    Theme.of(context).textTheme.headline.copyWith(fontSize: 35),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.007,
              ),
              Text(
                  ''' • A progressive disease that destroys memory and other important mental functions.
 • Brain cell connections and the cells themselves degenerate and die, eventually destroying memory and other important mental functions.
 • Memory loss and confusion are the main symptoms.
 • No cure exists, but medication and management strategies may temporarily improve symptoms.'''),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                'Symptoms',
                style:
                    Theme.of(context).textTheme.headline.copyWith(fontSize: 35),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.007,
              ),
              Text(''' • Requires a medical diagnosis
 • Memory loss and confusion are the main symptoms.
 • People may experience:
 • Cognitive: mental decline, difficulty thinking and understanding, confusion in the evening hours, delusion, disorientation, forgetfulness, making things up, mental confusion, difficulty concentrating, inability to create new memories, inability to do simple maths, or inability to recognise common things
 • Behavioural: aggression, agitation, difficulty with self care, irritability, meaningless repetition of own words, personality changes, restlessness, lack of restraint, or wandering and getting lost
 • Mood: anger, apathy, general discontent, loneliness, or mood swings
 • Psychological: depression, hallucination, or paranoia
 • Also common: inability to combine muscle movements, jumbled speech, or loss of appetite'''),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                'Treatments',
                style:
                    Theme.of(context).textTheme.headline.copyWith(fontSize: 35),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.007,
              ),
              Text('''• Treatment consists of cognition enhancing medications
 • No cure exists, but medication and management strategies may temporarily improve symptoms.
 • Medications
 • Cognition-enhancing medication
 • Self-care
 • Physical exercise
 • Specialists
 • Occupational Therapist, Geriatrician, Neurologist, Psychiatrist and Primary Care Provider (PCP) '''),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// About
// A progressive disease that destroys memory and other important mental functions.
// Brain cell connections and the cells themselves degenerate and die, eventually destroying memory and other important mental functions.
// Memory loss and confusion are the main symptoms.
// No cure exists, but medication and management strategies may temporarily improve symptoms.

// SYMPTOMS

// Requires a medical diagnosis
// Memory loss and confusion are the main symptoms.
// People may experience:
// Cognitive: mental decline, difficulty thinking and understanding, confusion in the evening hours, delusion, disorientation, forgetfulness, making things up, mental confusion, difficulty concentrating, inability to create new memories, inability to do simple maths, or inability to recognise common things
// Behavioural: aggression, agitation, difficulty with self care, irritability, meaningless repetition of own words, personality changes, restlessness, lack of restraint, or wandering and getting lost
// Mood: anger, apathy, general discontent, loneliness, or mood swings
// Psychological: depression, hallucination, or paranoia
// Also common: inability to combine muscle movements, jumbled speech, or loss of appetite

// TREATMENTS

// Treatment consists of cognition enhancing medications
// No cure exists, but medication and management strategies may temporarily improve symptoms.
// Medications
// Cognition-enhancing medication
// Self-care
// Physical exercise
// Specialists
// Occupational Therapist, Geriatrician, Neurologist, Psychiatrist and Primary Care Provider (PCP)
