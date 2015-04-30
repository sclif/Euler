// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p35 library.
library p35;

int countCircular(List<String> data){
  int count = 0;
  for(String s in data){
    if(allShiftsArePrimes(s, data)){
      print('$s');
      count++;
    }
  }
  return count;
}

bool allShiftsArePrimes(String s, List<String> data){
  String r = s;
  do{
    r = shiftLeft(r);
    if(!data.contains(r)){
      return false;
    }
  } while (r != s);
  return true;
}

String shiftLeft(String input){
  if(input.length == 1){
    return input;
  }
  return '${input.substring(1)}${input[0]}';
}