import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    @required this.monsterImage,
    @required this.monsterName,
    @required this.hp,
    @required this.dmgDice,
  });

  final String monsterImage;
  final String monsterName;
  final String dmgDice;
  final String hp;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      width: 300,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('images/' + monsterImage),
            ),
          ),
          Image(image: AssetImage('images/frame_grey_wood.png')),
          Column(
            children: <Widget>[
              SizedBox(
                height: 290,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  monsterName,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 75,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset('images/slot_grey_wood.png'),
                          Image.asset('images/mace.png'),
                          Center(
                            child: Text(
                              dmgDice,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                      height: 75,
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset('images/slot_grey_wood.png'),
                          Image.asset('images/shield.png'),
                          Center(
                            child: Text(
                              hp,
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BackCardWidget extends StatelessWidget {
  const BackCardWidget({@required this.progress});

  final String progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Stack(
        children: <Widget>[
          Image(
            image: AssetImage('images/backpart.png'),
          ),
          Text(progress),
        ],
      ),
    );
  }
}
