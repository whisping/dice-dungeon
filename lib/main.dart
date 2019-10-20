import 'package:flutter/material.dart';
import 'game_brain.dart';

void main() => runApp(DiceDungeon());

class DiceDungeon extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

GameBrain gameBrain = GameBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  String monsterName = gameBrain.getMonsterName();
  int greenHP = gameBrain.getMonsterHP()[0];
  String hpBar = gameBrain.getMonsterHP()[0].toString() + ' / ' + gameBrain.getMonsterHP()[1].toString();
  int blackHP = gameBrain.getMonsterHP()[1] - gameBrain.getMonsterHP()[0];
  String monsterImage = gameBrain.getEncounterImage();

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
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        //constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    monsterName + ' ' + hpBar,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(child: Row(children: <Widget>[
                Expanded(child: Container(color: Colors.green,
                  //child: Text(hpBar),
                ), flex: greenHP,),

                Expanded(child: Container(color: Colors.black), flex: blackHP,),
              ],

              )

              ,),
              Expanded(
                flex: 6,
                child: Center(
                  child: Image(image: AssetImage('images/' + monsterImage),),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      gameBrain.damageMonster();

                      if (gameBrain.isMonsterDead()) {
                        gameBrain.nextMonster();
                        monsterName = gameBrain.getMonsterName();
                        monsterImage = gameBrain.getEncounterImage();
                      }

                      hpBar = gameBrain.getMonsterHP()[0].toString() + ' / ' + gameBrain.getMonsterHP()[1].toString();
                      greenHP = gameBrain.getMonsterHP()[0];
                      blackHP = gameBrain.getMonsterHP()[1] - gameBrain.getMonsterHP()[0];

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
              Expanded(
                child: Center(child: Row(
                  children: <Widget>[
                    Text(gameBrain.getHP()),
                    Text(gameBrain.getHits()),
                    Text(gameBrain.getProgress()),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),),
              ),
              Expanded(
                child: Text(gameBrain.message()),
              )

            ],
          ),
        ),
      ),
    );
  }
}


