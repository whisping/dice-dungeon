import 'enemy.dart';
import 'dart:math';

class GameBrain {
  int progressCounter = 0;
  int maxPlayerHP = 80;
  int hp = 80;
  int hits = 10;


  List<Enemy> _enemyList = [
    Enemy('Slime', 20),
    Enemy('Goblin', 30),
    Enemy('Blue Dragon', 100),
  ];

  String getMonsterName() {
    return _enemyList[progressCounter].name;
  }

  String getMonsterHP() {
    return _enemyList[progressCounter].currentHP.toString() + ' / ' + _enemyList[progressCounter].maxHP.toString();
  }

//  String getMaxHP() {
//    return _enemyList[_progressCounter].maxHP.toString();
//  }

  void damageMonster() {
    if (hits > 0) {
      int dmg = (Random().nextInt(6) + 1)+(Random().nextInt(6) + 1);
      _enemyList[progressCounter].currentHP -= dmg;
      print('monster takes $dmg');
      hits -= 1;
    }
    int playerDmg = (Random().nextInt(6) + 1);
    hp -= playerDmg;
    print('player takes $playerDmg');
  }

  bool isMonsterDead() {
    if (_enemyList[progressCounter].currentHP <= 0) {
      print('killed ' + _enemyList[progressCounter].name);
      return true;
    } else {
      return false;
    }
  }

  String getProgress() {
    return 'Progress: ' + (progressCounter + 1).toString();
  }

  String getHP() {
    return 'HP: $hp/$maxPlayerHP';
  }

  String getHits() {
    return 'Hits left: $hits';
  }

  ////////////   GAME FLOW   /////////

  void restart() {
    progressCounter = 0;
    hp = maxPlayerHP;
    hits = 10;
  }

  void nextMonster() {
    progressCounter += 1;
  }
}