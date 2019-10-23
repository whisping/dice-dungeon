import 'dart:math';

int roll(int dice) {
  int sum = 0;
  int result = (Random().nextInt(dice) + 1);
  if (result == dice) {
    sum += dice + roll(dice);
    //print('crit');
  } else if (result == 1) {
    sum = 0;
    //print('miss');
  } else {
    sum += result;
  }
  print('roll 1D' + dice.toString() + ' = ' + sum.toString());
  return sum;
}
