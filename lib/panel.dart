import 'package:flutter/material.dart';

class PanelWidget extends StatelessWidget {
  final String hp;
  final String hitsLeft;
  final Function onPressed;
  final Function onPressedWeapon;
  final List weapon;

  PanelWidget({
    @required this.weapon,
    @required this.hp,
    @required this.hitsLeft,
    @required this.onPressed,
    @required this.onPressedWeapon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset('images/slot_metal.png'),
                      Image.asset('images/' + weapon[0] + '.png'),
                      FlatButton(
                        onPressed: onPressedWeapon,
                        child: Text(
                          weapon[4].toString(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Image.asset('images/menu.png')),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset('images/slot_metal.png'),
                      FlatButton(
                        onPressed: onPressed,
                        child: Image.asset('images/roll.png'),
//                  color: Colors.red,
//                  child: Text(
//                    'ATTACK! \n' + hitsLeft,
//                    style: TextStyle(
//                      fontSize: 20.0,
//                    ),
//                    textAlign: TextAlign.center,
//                  ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Text(hitsLeft)),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset('images/slot_metal.png'),
                      Image.asset('images/shield.png'),
                      Text(
                        hp,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Image.asset('images/inventory.png')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
