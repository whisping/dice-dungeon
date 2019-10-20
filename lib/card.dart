
class Card {
  String name;
  CardTypes type;
}

enum CardTypes {
  Enemy,
  Trap,
  Door,
  Chest,
  NPC
}

enum DamageTypes {
  fire,
  water,
  wind,
  earth,
  electricity,
  ether,
  poison,
}

class Enemy extends Card {
  int maxHP;
  int hp;
  int dice;

  Enemy (String name, int maxHP, int dice) {
    this.dice = dice;
    this.name = name;
    this.maxHP = maxHP;
    this.hp = maxHP;
    this.type = CardTypes.Enemy;
  }
}

class Trap extends Card {
  //int dmg;
  DamageTypes damageType;
  int dice;

  Trap (String name, int dice) {
    this.dice = dice;
    this.name = name;
    //this.dmg = dmg;
    this.type = CardTypes.Trap;
  }
}

class Door extends Card {
  int hp;
  int maxHP;

  Door (String name, int maxHP) {
    this.name = name;
    this.maxHP = maxHP;
    this.hp = maxHP;
    this.type = CardTypes.Door;
  }
}

class Chest extends Card {
  String content;

  Chest (String name, String content) {
    this.name = name;
    this.content = content;
    this.type = CardTypes.Chest;
  }
}

class NPC extends Card {
  int healAmount;

  NPC (String name, int healAmount) {
    this.name = name;
    this.healAmount = healAmount;
    this.type = CardTypes.NPC;
  }
}
