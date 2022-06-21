import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/material.dart';
import 'package:game/controllers/BlackJackController.dart';
import 'package:game/widgets/CardImage.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

BlackJackController controller = BlackJackController();
class _GamePageState extends State<GamePage> {
  var dealerCards = controller.getDealerCards();
  var dealerScore = controller.getDealerScore();
  var playerCards = controller.getPlayerCards();
  var playerScore = controller.getPlayerScore();



  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance?.addPostFrameCallback((_) => {
      setState(() {
        if(!controller.dealerFinishedTurn) {
          controller.dealerNextDecision();

          dealerCards = controller.getDealerCards();
          dealerScore = controller.getDealerScore();
          playerCards = controller.getPlayerCards();
          playerScore = controller.getPlayerScore();

          if (dealerScore > 21) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('You won!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);

                        setState(() {
                          controller.playerEndsTurn();
                          dealerCards = controller.getDealerCards();
                          dealerScore = controller.getDealerScore();
                          playerCards = controller.getPlayerCards();
                          playerScore = controller.getPlayerScore();
                          print('player won overcount');

                          controller.dealerFinishedTurn = true;
                          controller.dealCards();

                        });
                      },
                      child: const Text('Continue'),
                    )
                  ],
                )
            );
            return ;
          }

          if (dealerScore > playerScore) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Dealer Won!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);

                        setState(() {
                          controller.playerEndsTurn();
                          dealerCards = controller.getDealerCards();
                          dealerScore = controller.getDealerScore();
                          playerCards = controller.getPlayerCards();
                          playerScore = controller.getPlayerScore();
                          print('dealer won ponits');

                          controller.dealerFinishedTurn = true;
                          controller.dealCards();
                        });
                      },
                      child: const Text('Continue'),
                    )
                  ],
                )
            );

            return ;
          }

          if (dealerScore == playerScore && dealerScore > 0) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Draw!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);

                        setState(() {
                          controller.playerEndsTurn();
                          dealerCards = controller.getDealerCards();
                          dealerScore = controller.getDealerScore();
                          playerCards = controller.getPlayerCards();
                          playerScore = controller.getPlayerScore();
                          print('draw');

                          controller.dealerFinishedTurn = true;
                          controller.dealCards();
                        });
                      },
                      child: const Text('Continue'),
                    )
                  ],
                )
            );

            return ;
          }
        }
      })
    });
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/table_background.jpg')
            )
        ),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    margin: const EdgeInsets.all(0),
                    width: 110,
                    child: Stack(
                      children: const [
                        Positioned(
                          child: Image(image: AssetImage('assets/face.png'), height: 110),
                        ),
                        Positioned(
                          child: Image(image: AssetImage('assets/face.png'), height: 110),
                          left: 7,
                        ),
                        Positioned(
                          child: Image(image: AssetImage('assets/face.png'), height: 110),
                          left: 14,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    height: 140,
                      child: Stack(
                        children: [
                          for (var card in dealerCards)
                            Positioned(
                              child: DelayedDisplay(
                                  delay: Duration(milliseconds: 400),
                                  child: CardImage(path: card.imagePath)
                              ),
                              left: 30.0 * card.id
                            ),
                        ],
                      ),
                    )
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: DelayedDisplay(
                      delay: Duration(milliseconds: 400),
                      child: Text(
                        'Dealer: ' + dealerScore.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        )
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: 100,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                    child: DelayedDisplay(
                      delay: Duration(milliseconds: 400),
                      child: Text(
                        'Player: ' + playerScore.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        )
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      height: 130,
                      child: Stack(
                        children: [
                          for (var card in playerCards)
                            Positioned(
                                child: DelayedDisplay(
                                  delay: Duration(milliseconds: 400),
                                  child: CardImage(path: card.imagePath)
                                ),
                                left: 30.0 * card.id
                            ),
                        ],
                      ),
                    )
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: MaterialButton(
                                  onPressed: () {
                                      setState(() {
                                        controller.playerHits();
                                        playerScore = controller.getPlayerScore();

                                        if (playerScore > 21) {
                                          showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text('Dealer Won!'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);

                                                      setState(() {
                                                        controller.playerEndsTurn();

                                                        dealerCards = controller.getDealerCards();
                                                        dealerScore = controller.getDealerScore();
                                                        playerCards = controller.getPlayerCards();
                                                        playerScore = controller.getPlayerScore();
                                                        print('dealer won overcount');
                                                      });
                                                    },
                                                    child: const Text('Continue'),
                                                  )
                                                ],
                                              )
                                          );
                                        }
                                        if (playerScore == 21) {
                                          setState(() {
                                            controller.playerEndsTurn();
                                            dealerCards = controller.getDealerCards();
                                            dealerScore = controller.getDealerScore();
                                            playerCards = controller.getPlayerCards();
                                            playerScore = controller.getPlayerScore();
                                          });
                                        }
                                      });
                                  },
                                  child: Stack(
                                    children: const [
                                      Image(image: AssetImage('assets/button.png'), height: 60),
                                      Positioned(
                                        top: 17,
                                        left: 60,
                                        child: Text(
                                          'Hit',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20
                                          )
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      controller.playerEndsTurn();

                                      dealerCards = controller.getDealerCards();
                                      dealerScore = controller.getDealerScore();
                                      playerCards = controller.getPlayerCards();
                                      playerScore = controller.getPlayerScore();
                                    });
                                  },
                                  child: Stack(
                                    children: const [
                                      Image(image: AssetImage('assets/button.png'), height: 60),
                                      Positioned(
                                        top: 17,
                                        left: 45,
                                        child: Text(
                                            'Stand',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20
                                            )
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            ),
                          ]
                        )
                      )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 40),
                          child: const Text(
                              'Bankroll: 22',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              )
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 40),
                          child: const Text(
                              'Bet: 22',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20
                              )
                          ),
                        ),
                      ]
                    ),
                  )
                ],
              )
            ],
          )
          ),
        ),
      );
  }
}