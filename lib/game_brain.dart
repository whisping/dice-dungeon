import 'package:destini_challenge_starting/main.dart';

import 'card.dart';
import 'dart:math';

class GameBrain {
  int progressCounter = 0;
  int maxPlayerHP = 80;
  int hp = 80;
  int hits = 20;


  List<Card> _enemyList = [
    Enemy('Slime', 20, 6),
    Door('Small Door', 10),
    Enemy('Goblin', 30, 6),
    Door('Wooden Door', 50),
    Trap('Trap', 10),
    NPC('Tor', 5),
    Enemy('Blue Dragon', 100, 10),
  ];

  String getMonsterName() {
    return _enemyList[progressCounter].name;
  }

  String getMonsterHP() {
    if (_enemyList[progressCounter].type == CardTypes.Enemy) {
      Enemy enemy = _enemyList[progressCounter];
      return enemy.hp.toString() + ' / ' + enemy.maxHP.toString();
    } else
      if ( _enemyList[progressCounter].type == CardTypes.Door ) {
        Door door = _enemyList[progressCounter];
        return door.hp.toString();
      }
      else {
      return 'none HP';
    }
  }

//  String getMaxHP() {
//    return _enemyList[_progressCounter].maxHP.toString();
//  }

  int roll(int dice) {
    int sum = 0;
    int result = (Random().nextInt(dice) + 1);
    if (result == dice) {
      sum += dice + roll(dice);
      print('crit');
    } else if (result == 1) {
      sum = 0;
      print('miss');
    } else {
      sum += result;
    }
    return sum;
  }

  void damageMonster() {
    Card card = _enemyList[progressCounter];
    CardTypes type = card.type;
    // door
    if (type == CardTypes.Door) {
      if (hits > 0) {
        Door enemy = card;
        int dmg1 = roll(6);
        int dmg2 = roll(6);
        int dmg = dmg1 + dmg2;
        enemy.hp -= dmg;
        _message = 'door takes $dmg($dmg1 + $dmg2)';
        print(_message);
        hits -= 1;
      }
    }
    // enemy
    if (type == CardTypes.Enemy) {
      Enemy enemy = card;
      if (hits > 0) {
        int dmg1 = roll(6);
        int dmg2 = roll(6);
        int dmg = dmg1 + dmg2;
        enemy.hp -= dmg;
        _message = 'monster takes $dmg($dmg1 + $dmg2), ';
        hits -= 1;
      }
      int dice = enemy.dice;
      int playerDmg = roll(dice);
      hp -= playerDmg;
      _message += 'player takes $playerDmg';
      print(_message);
    }
    //trap
    if (type == CardTypes.Trap) {
      Trap trap = card;
      int dice = trap.dice;
      int playerDmg = roll(dice);
      hp -= playerDmg;
      _message = 'player takes $playerDmg';
      print(_message);
    }
    // NPC
    if (type == CardTypes.NPC) {
      NPC npc = card;
      hp += npc.healAmount;
      hits += 5;

      _message = 'He heals you ' + npc.healAmount.toString() + ' and give 5 hits.';
      print(_message);
    }
  }

  bool isMonsterDead() {
    Card card = _enemyList[progressCounter];
    CardTypes type = card.type;
    // enemy
    if (type == CardTypes.Enemy) {
      Enemy enemy = card;
      if (enemy.hp <= 0) {
        print('killed ' + enemy.name);
        return true;
      } else {
        return false;
      }
    }

    // door

    if (type == CardTypes.Door) {
      Door door = card;
      if (door.hp <= 0) {
        print('Break through ' + door.name);
        return true;
      } else {
        return false;
      }
    }

    // trap or NPC
    if (type == CardTypes.Trap || type == CardTypes.NPC) {
        return true;
    }
  }

  String getProgress() {
    return 'Progress: ' + (progressCounter + 1).toString() + '/' + (_enemyList.length).toString();
  }

  String getHP() {
    return 'HP: $hp/$maxPlayerHP';
  }

  String getHits() {
    return 'Hits left: $hits';
  }

  String _message = 'place for messages';
  String message() {
    return _message;
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