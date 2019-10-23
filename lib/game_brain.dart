import 'card.dart';
import 'roll.dart';
import 'dungeon.dart';

class GameBrain {
  int progressCounter = 0;
  int maxPlayerHP = 180;
  int hp = 180;
  int hitsRemain = 100;
  List<Creature> _enemyList = [];
  List weapons = [
    ['sword', 2, 6, 0, '2D6'],
    ['mace', 1, 8, 3, '1D8+3']
  ];
  int choosenWeapon = 0;

  GameBrain() {
    Deck deck = Deck(crab, 20, murl, 9, boss);
    _enemyList = deck.cards;
  }

  void nextWeapon() {
    (choosenWeapon == 0) ? choosenWeapon = 1 : choosenWeapon = 0;
  }

  String getEncounterImage() {
    String name = _enemyList[progressCounter].name;
    return name + '.png';
  }

  String getMonsterName() {
    return _enemyList[progressCounter].name;
  }

  int getMonsterHP() {
    return _enemyList[progressCounter].hp;
  }

  String getDmgDice() {
    String res = '1D' + _enemyList[progressCounter].dmgDice.toString();
    if (_enemyList[progressCounter].dmgMod != 0) {
      res += '+' + _enemyList[progressCounter].dmgMod.toString();
    }

    return res;
  }

  void damageMonster() {
    Creature card = _enemyList[progressCounter];

    if (hitsRemain > 0) {
      var weapon = weapons[choosenWeapon];
      int numOfDices = weapon[1];
      int dmg = 0;
      for (int i = 0; i < numOfDices; i += 1) {
        dmg += roll(weapon[2]);
      }
      dmg += weapon[3];
      card.hp -= dmg;
      _message = 'monster takes $dmg, ';
      hitsRemain -= 1;
    }
    int playerDmg = card.giveDamage();
    hp -= playerDmg;
    _message += 'player takes $playerDmg';
    print(_message);
  }

  bool isMonsterDead() {
    Creature card = _enemyList[progressCounter];
    // enemy
    if (card.hp <= 0) {
      print('killed ' + card.name);
      return true;
    } else {
      return false;
    }
  }

  String getProgress() {
    return (progressCounter + 1).toString() +
        '/' +
        (_enemyList.length).toString();
  }

  String getHP() {
    return '$hp/$maxPlayerHP';
  }

  String getHits() {
    return 'Hits left: $hitsRemain';
  }

  String _message = 'place for messages';
  String message() {
    return _message;
  }

  ////////////   GAME FLOW   /////////

  void restart() {
    progressCounter = 0;
    hp = maxPlayerHP;
    hitsRemain = 20;
  }

  void nextMonster() {
    progressCounter += 1;
  }
}
