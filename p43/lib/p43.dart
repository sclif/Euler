// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p43 library.
library p43;

List<int> divideByList = [17, 13, 11, 7, 5, 3, 2];

List<String> divisibleBy(int n, int byIdx, List<int> remainedDigits){
  int by = divideByList[byIdx];
  List<String> result = [];
  if(n % by == 0){
//    print('$n $remainedDigits');
    if(byIdx == divideByList.length - 1){
      if(remainedDigits.length != 1){
        print('$remainedDigits $n $byIdx');
      }
      result.add('${remainedDigits[0]}$n');
      return result;
    }
    String l = n.remainder(10).toString();
    for(int d in remainedDigits) {
      int next = d*100 + n ~/ 10;
      List<int> newRemained = new List<int>.from(remainedDigits);
      newRemained.remove(d);
      var div = divisibleBy(next, byIdx + 1, newRemained);
      if(div != null && div.length != 0){
        div.forEach((a) => result.add(a + l));
      }
    }
  }
  return result;
}