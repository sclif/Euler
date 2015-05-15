// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p54 library.
library p54;
import 'dart:math';

class PokerCard{
  int value;
  int suit;
  
  PokerCard.fromString(String s){
    int code = s.codeUnitAt(0);
    if(code < 58 && code > 49){
      value = code - 48;
    } else {
      switch(code){
        case 84: 
          value = 10; //Ten
          break;
        case 74:
          value = 11; //Jack
          break;
        case 81:
          value = 12; //Queen
          break;
        case 75:
          value = 13; //King
          break;
        case 65:
          value = 14; //Ace
          break;
        default:
          value = 0;
          break;
      }
    }
    int suitCode = s.codeUnitAt(1);
    switch(suitCode){
      case 83:
        suit = 1; //Spades
        break;
      case 67:
        suit = 2; //Clubs
        break;
      case 68:
        suit = 3; //Diamonds
        break;
      case 72:
        suit = 4; //Hearts
        break;
      default:
        suit = 0;
        break;
    }
  }
  
  String toString(){
    return '$value $suit';
  }
}

class PokerHand{
  List<PokerCard> hand;
  
  PokerHand(this.hand);
  
  PokerHand.fromString(String s){
    hand = [];
    var cards = s.split(" ");
    cards.forEach((card) => hand.add(new PokerCard.fromString(card)));
  }
  
  String toString(){
    StringBuffer b = new StringBuffer();
    hand.forEach((card) => b.write('$card, '));
    return b.toString();
  }
  
  double evaluate(){
    int flushSuit = -1;
    List<int> straight = [];
    int firstSetLength = -1;
    int firstSetValue = -1;
    int secondSetLength = -1;
    int secondSetValue = -1;
    
    for( int i = 0; i < hand.length; i++ ){
      var card = hand[i];
      if(flushSuit == -1){
        flushSuit = card.suit;
      }
      if(straight != null && straight.length == 0){
        straight.add(card.value);
      }
      
      for( int j = i + 1; j < hand.length; j++ ){
        var next = hand[j];
        if(flushSuit != next.suit){
          flushSuit = 0;
          
          if(next.value == card.value){
            if(firstSetLength > 0){
              if(firstSetValue == next.value){
                firstSetLength++;
              } else {
                if(secondSetValue == next.value){
                  secondSetLength++;
                } else {
                  secondSetLength = 2;
                  secondSetValue = next.value;
                }
              }
            } else {
              firstSetLength = 2;
              firstSetValue = next.value;
            }
          }
        }
        if(straight != null && straight.length < 5){
          if(firstSetLength > 0 || secondSetLength > 0){
            straight = null;
          } else {
            bool seemsStraight = true;
            for(int str in straight){
              int diff = (str - next.value).abs();
              if(diff == 0 || diff > 4){
                seemsStraight = false;
                break;
              }
            }
            if(seemsStraight){
              straight.add(next.value);
            }else{
              straight = null;
            }
          }
        }
      }
    }

    StringBuffer s = new StringBuffer();
    if(straight != null){
      straight.sort();
      int rank = 60;
      if(flushSuit > 0){
        rank = 140;
      }
      s.write('${straight.last + rank}');
    } else if(flushSuit > 0){
      int highest = 0;
      hand.forEach((a) => highest = max(highest, a.value));
      s.write('${highest + 80}');
    } else {
      Set<int> exclude = [];
      switch(firstSetLength){
        case 2:
          exclude.add(firstSetValue);
          switch(secondSetLength){
            case 2:
              s.write('${max(firstSetValue, secondSetValue) + 20}.${_to00(min(firstSetValue, secondSetValue))}');
              exclude.add(secondSetValue);
              break;
            case 4: // 3 + 1
              _fullHouse(s, secondSetLength, secondSetValue, firstSetLength, firstSetValue);
              exclude.add(secondSetValue);
              break;
            case -1:
              s.write('$firstSetValue.');
              break;
            default:
              print('$secondSetLength ??? secondSetLength (1st = 2)');
              break;
          }
          break;
        case 4: // 3 + 1
          exclude.add(firstSetValue);
          switch(secondSetLength){
            case 2:
              _fullHouse(s, firstSetLength, firstSetValue, secondSetLength, secondSetValue);
              exclude.add(secondSetValue);
              break;
            case -1:
              s.write('${firstSetValue + 40}.');
              break;
            default:
              print('$secondSetLength ??? secondSetLength (1st = 3)');
              break;
          }
          break;
        case 7: //4 + 2 +1
          exclude.add(firstSetValue);
          s.write('${firstSetValue + 120}.');
          break;
        case -1:
          s.write('0.');
          break;
        default:
          print('$firstSetLength ??? firstSetLength');
          break;
      }
      List<int> precision = [];
      for(var card in hand){
        if(exclude.contains(card.value)){
          continue;
        }
        precision.add(card.value);
      }
      precision.sort();
      for( int i = precision.length - 1; i >= 0; i-- ){
        s.write(_to00(precision[i]));
      }
    }
    return double.parse(s.toString());
  }
  
  String _to00(int n){
    return n>9 ? '$n' : '0$n';
  }
  
  void _fullHouse(StringBuffer s, int l1, int v1, int l2, int v2){
    s.write('${v1 + 100}.${_to00(v2)}');
  }
}