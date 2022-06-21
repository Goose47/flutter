import 'package:game/classes/Deck.dart';
import 'package:game/classes/Card.dart';
import './../import/deck.dart';
import 'dart:math';

class BlackJackController {
  Deck deck = Deck(cards: [...cardDeck.cards]);
  late Deck dealerDeck;
  late Deck playerDeck;

  bool playerFinishedTurn = false;
  bool dealerFinishedTurn = false;

  final _random = Random();

  BlackJackController() {
    List<Card> dealerCards = [];
    dealerDeck = Deck(cards: dealerCards);
    List<Card> playerCards = [];
    playerDeck = Deck(cards: playerCards);
    dealCards();
  }

  List<Card> getDealerCards()
  {
    return dealerDeck.cards;
  }

  List<Card> getPlayerCards()
  {
    return playerDeck.cards;
  }

  int getPlayerScore()
  {
    int score = countValue(playerDeck);

    if (score > 21){
      for (var card in playerDeck.cards) {
        if (card.value == 11){
          card.value = 1;
        }
      }

      score = countValue(playerDeck);
    }

    return score;
  }

  int getDealerScore()
  {
    int score = countValue(dealerDeck);

    return score;
  }

  void playerHits()
  {
    if(playerFinishedTurn){
      return ;
    }

    insertCardIntoDeck(playerDeck);
  }

  void playerEndsTurn()
  {
    playerFinishedTurn = true;
    dealerFinishedTurn = false;

    if(getPlayerScore() > 21) {
      dealerFinishedTurn = true;
      dealCards();
      return ;
    }

    removeFaceCard();

    dealerNextDecision();
  }

  bool isPlayerEndedTurn()
  {
    return playerFinishedTurn;
  }

  void dealerNextDecision()
  {
    if(!playerFinishedTurn) {
      return ;
    }

    if (dealerFinishedTurn) {
      dealCards();
      return ;
    }

    int score = getDealerScore();

    if (score > getPlayerScore()) {
      dealerFinishedTurn = true;
      return ;
    }

    if(score == 21) {
      dealerFinishedTurn = true;
      return ;
    }

    if(score > 21) {
      dealerFinishedTurn = true;
      return ;
    }

    if(score < getPlayerScore()) {
      insertCardIntoDeck(dealerDeck);
      return ;
    }
  }

  void dealCards()
  {
    playerFinishedTurn = false;
    // dealerFinishedTurn = false;

    if (deck.cards.length != 52) {
      // deck = cardDeck;

      deck.cards.clear();
      deck.cards = [...cardDeck.cards];
      print('deck flushed, cards in deck: ' + cardDeck.cards.length.toString());
    }

    playerDeck.cards.clear();
    dealerDeck.cards.clear();
    print('cards flushed');
    insertCardIntoDeck(dealerDeck);
    insertFaceCard();
    print('dealer cards dealt');
    insertCardIntoDeck(playerDeck);
    insertCardIntoDeck(playerDeck);
    print('player cards dealt');
  }

  //////////////////////////////

  void insertCardIntoDeck(Deck deckToChange)
  {
    var card = deck.cards[_random.nextInt(deck.cards.length)];

    deck.cards.removeWhere((element) => element.id == card.id);
    card.id = deckToChange.cards.length;
    deckToChange.cards.add(card);
  }

  void insertFaceCard()
  {
    Card card = Card(id: 1, value: 0, imagePath: 'assets/face.png');

    dealerDeck.cards.add(card);
  }

  void removeFaceCard()
  {
    if (dealerDeck.cards.where((el) => el.imagePath == 'assets/face.png').isNotEmpty) {
      dealerDeck.cards.removeWhere((element) => element.imagePath == 'assets/face.png');
      insertCardIntoDeck(dealerDeck);
    }
  }

  int countValue(Deck deckToCount)
  {
    int score = 0;

    for (var card in deckToCount.cards) {
      score += card.value;
    }

    return score;
  }
}

