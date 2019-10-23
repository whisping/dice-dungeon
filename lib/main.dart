import 'package:flutter/material.dart';
import 'game_brain.dart';
import 'cardWidgets.dart';
import 'panel.dart';

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
  String hpBar = gameBrain.getMonsterHP().toString();
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
                    'First Dungeon',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    BackCardWidget(
                      progress: gameBrain.getProgress(),
                    ),
                    CardWidget(
                      monsterImage: monsterImage,
                      monsterName: monsterName,
                      hp: hpBar,
                      dmgDice: gameBrain.getDmgDice(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(gameBrain.message()),
              ),
              Expanded(
                  flex: 3,
                  child: PanelWidget(
                    hp: gameBrain.getHP(),
                    hitsLeft: gameBrain.getHits(),
                    weapon: gameBrain.weapons[gameBrain.choosenWeapon],
                    onPressedWeapon: () {
                      setState(() {
                        gameBrain.nextWeapon();
                      });
                    },
                    onPressed: () {
                      setState(() {
                        gameBrain.damageMonster();

                        if (gameBrain.isMonsterDead()) {
                          gameBrain.nextMonster();
                          monsterName = gameBrain.getMonsterName();
                          monsterImage = gameBrain.getEncounterImage();
                        }

                        hpBar = gameBrain.getMonsterHP().toString();
                      });
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
