import './../classes/Deck.dart';
import './../classes/Card.dart';

List<Card> cards = [
  //2
  Card(
    id: 0,
    value: 2,
    imagePath: 'assets/cards/2s.png'
  ),
  Card(
    id: 1,
    value: 2,
    imagePath: 'assets/cards/2c.png'
  ),
  Card(
    id: 2,
    value: 2,
    imagePath: 'assets/cards/2h.png'
  ),
  Card(
    id: 3,
    value: 2,
    imagePath: 'assets/cards/2d.png'
  ),
  //3
  Card(
    id: 4,
    value: 3,
    imagePath: 'assets/cards/3s.png'
  ),
  Card(
    id: 5,
    value: 3,
    imagePath: 'assets/cards/3c.png'
  ),
  Card(
    id: 6,
    value: 3,
    imagePath: 'assets/cards/3h.png'
  ),
  Card(
    id: 7,
    value: 3,
    imagePath: 'assets/cards/3d.png'
  ),
  //4
  Card(
    id: 8,
    value: 4,
    imagePath: 'assets/cards/4s.png'
  ),
  Card(
    id: 9,
    value: 4,
    imagePath: 'assets/cards/4c.png'
  ),
  Card(
    id: 10,
    value: 4,
    imagePath: 'assets/cards/4h.png'
  ),
  Card(
    id: 11,
    value: 4,
    imagePath: 'assets/cards/4d.png'
  ),
  //5
  Card(
    id: 12,
    value: 5,
    imagePath: 'assets/cards/5s.png'
  ),
  Card(
    id: 13,
    value: 5,
    imagePath: 'assets/cards/5c.png'
  ),
  Card(
    id: 14,
    value: 5,
    imagePath: 'assets/cards/5h.png'
  ),
  Card(
    id: 15,
    value: 5,
    imagePath: 'assets/cards/5d.png'
  ),
  //6
  Card(
    id: 16,
    value: 6,
    imagePath: 'assets/cards/6s.png'
  ),
  Card(
    id: 17,
    value: 6,
    imagePath: 'assets/cards/6c.png'
  ),
  Card(
    id: 18,
    value: 6,
    imagePath: 'assets/cards/6h.png'
  ),
  Card(
    id: 19,
    value: 6,
    imagePath: 'assets/cards/6d.png'
  ),
  //7
  Card(
    id: 20,
    value: 7,
    imagePath: 'assets/cards/7s.png'
  ),
  Card(
    id: 21,
    value: 7,
    imagePath: 'assets/cards/7c.png'
  ),
  Card(
    id: 22,
    value: 7,
    imagePath: 'assets/cards/7h.png'
  ),
  Card(
    id: 23,
    value: 7,
    imagePath: 'assets/cards/7d.png'
  ),
  //8
  Card(
    id: 24,
    value: 8,
    imagePath: 'assets/cards/8s.png'
  ),
  Card(
    id: 25,
    value: 8,
    imagePath: 'assets/cards/8c.png'
  ),
  Card(
    id: 26,
    value: 8,
    imagePath: 'assets/cards/8h.png'
  ),
  Card(
    id: 27,
    value: 8,
    imagePath: 'assets/cards/8d.png'
  ),
  //9
  Card(
    id: 28,
    value: 9,
    imagePath: 'assets/cards/9s.png'
  ),
  Card(
    id: 29,
    value: 9,
    imagePath: 'assets/cards/9c.png'
  ),
  Card(
    id: 30,
    value: 9,
    imagePath: 'assets/cards/9h.png'
  ),
  Card(
    id: 31,
    value: 9,
    imagePath: 'assets/cards/9d.png'
  ),
  //T
  Card(
    id: 32,
    value: 10,
    imagePath: 'assets/cards/ts.png'
  ),
  Card(
    id: 33,
    value: 10,
    imagePath: 'assets/cards/tc.png'
  ),
  Card(
    id: 34,
    value: 10,
    imagePath: 'assets/cards/th.png'
  ),
  Card(
    id: 35,
    value: 10,
    imagePath: 'assets/cards/td.png'
  ),
  //J
  Card(
    id: 36,
    value: 10,
    imagePath: 'assets/cards/js.png'
  ),
  Card(
    id: 37,
    value: 10,
    imagePath: 'assets/cards/jc.png'
  ),
  Card(
    id: 38,
    value: 10,
    imagePath: 'assets/cards/jh.png'
  ),
  Card(
    id: 39,
    value: 10,
    imagePath: 'assets/cards/jd.png'
  ),
  //Q
  Card(
    id: 40,
    value: 10,
    imagePath: 'assets/cards/qs.png'
  ),
  Card(
    id: 41,
    value: 10,
    imagePath: 'assets/cards/qc.png'
  ),
  Card(
    id: 42,
    value: 10,
    imagePath: 'assets/cards/qh.png'
  ),
  Card(
    id: 43,
    value: 10,
    imagePath: 'assets/cards/qd.png'
  ),
  //K
  Card(
    id: 44,
    value: 10,
    imagePath: 'assets/cards/ks.png'
  ),
  Card(
    id: 45,
    value: 10,
    imagePath: 'assets/cards/kc.png'
  ),
  Card(
    id: 46,
    value: 10,
    imagePath: 'assets/cards/kh.png'
  ),
  Card(
    id: 47,
    value: 10,
    imagePath: 'assets/cards/kd.png'
  ),
  //A
  Card(
    id: 48,
    value: 11,
    imagePath: 'assets/cards/as.png'
  ),
  Card(
    id: 49,
    value: 11,
    imagePath: 'assets/cards/ac.png'
  ),
  Card(
    id: 50,
    value: 11,
    imagePath: 'assets/cards/ah.png'
  ),
  Card(
    id: 51,
    value: 11,
    imagePath: 'assets/cards/ad.png'
  ),
];

Deck cardDeck = Deck(cards: cards);