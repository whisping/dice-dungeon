class Enemy {
  String name;
  int maxHP;
  int currentHP;

  Enemy (String name, int maxHP) {
    this.name = name;
    this.maxHP = maxHP;
    this.currentHP = maxHP;
  }
}