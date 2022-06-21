import './Card.dart';

class Deck {
  List<Card> cards = [];

  Deck({required this.cards});

  void shuffle() {
    cards.shuffle();
  }
}

