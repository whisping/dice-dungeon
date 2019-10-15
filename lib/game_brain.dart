import 'enemy.dart';

class GameBrain {
  int _progressCounter = 0;

  List<Enemy> _enemyList = [
    Enemy('slime', 20),
    Enemy('goblin', 30)
  ];

  String getMonsterName() {
    return _enemyList[_progressCounter].name;
  }

  int getMonsterHP() {
    return _enemyList[_progressCounter].currentHP;
  }

  void damageMonster(int damage) {
    _enemyList[_progressCounter].currentHP -= damage;
  }

  bool isMonsterDead() {
    if (_enemyList[_progressCounter].currentHP <= 0) {
      return true;
    } else {
      return false;
    }
  }

  void restart() {
    _progressCounter = 0;
  }
}