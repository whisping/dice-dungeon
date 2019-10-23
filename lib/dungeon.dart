import 'roll.dart';
import 'dart:math';

//void main() {
//  Deck deck = Deck(crab, 20, murl, 9, boss);
//}

class Dungeon {
  int cardsInDeck = 30;
  int lastBossCardsNum = 10;
}

class Creature {
  int hp;
  int dmgDice;
  int dmgMod;
  int quantity;
  String name;

  Creature(name, numOfHPDice, hpDice, hpMod, dmgDice, dmgMod) {
    //hp = 1d6 + hpMod
    this.hp = hpMod;
    do {
      this.hp += roll(hpDice);
      numOfHPDice -= 1;
    } while (numOfHPDice > 0);
    //dmg = 1d6 + dmgMod
    this.dmgMod = dmgMod;
    this.dmgDice = dmgDice;
    this.quantity = 20;
    this.name = name;
  }

  int giveDamage() {
    return dmgMod + roll(dmgDice);
  }
}

Creature crab = Creature('Crab', 1, 6, 9, 6, 0);
Creature murl = Creature('Murloc', 1, 6, 12, 6, 1);
Creature boss = Creature('Something from deeps', 2, 6, 33, 8, 0);

class Deck {
  List<Creature> cards = [];

  Deck(creature1, num1, creature2, num2, boss) {
    this.cards = createDeck(boss);

    print('created deck');
  }

  List<Creature> createDeck(boss) {
    List<Creature> deck = [];
    List<Creature> smallDeck = [];

    for (int i = 0; i < 20; i += 1) {
      deck.add(Creature('Crab', 1, 6, 9, 6, 0));
    }
    for (int i = 0; i < 9; i += 1) {
      deck.add(Creature('Murloc', 1, 6, 12, 6, 1));
    }
    deck.shuffle();

    smallDeck = deck.sublist(0, 8);
    deck = deck.sublist(8);
    smallDeck.add(boss);
    smallDeck.shuffle();

    deck.addAll(smallDeck);

    for (int i = 0; i < 30; i += 1) {
      print((i + 1).toString() +
          ': ' +
          deck[i].name +
          ' ' +
          deck[i].hp.toString());
    }
    return deck;
  }
}

List shuffle(List items) {
  var random = new Random();

  // Go through all elements.
  for (var i = items.length - 1; i > 0; i--) {
    // Pick a pseudorandom number according to the list length
    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}
