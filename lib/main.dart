import 'package:destini_challenge_starting/game_brain.dart';
import 'package:flutter/material.dart';
import 'story_brain.dart';
import 'game_brain.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

GameBrain gameBrain = GameBrain();
//StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'MonsterName',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'HP 15/20',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Center(
                  child: Image(image: AssetImage('images/monster1.png'),),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    //attack a monster
                    setState(() {
                      //storyBrain.nextStory(1);

                    });

                  },
                  color: Colors.red,
                  child: Text(
                    'ATTACK!',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}


