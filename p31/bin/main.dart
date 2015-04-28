// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:p31/p31.dart' as p31;

main() {
  int counter = 0;
  int s = 200;
  for(int a = 0; a <= s/200; a++){
//    s = SUM - 200*a;
    for(int b = 0; b <= s/100; b++){
//      s = s - 100*b;
      for(int c = 0; c <= s/50; c++){
//        s = s - 50*c;
        for(int d = 0; d <= s/20; d++){
//          s = s - 20*d;
          for(int e = 0; e <= s/10; e++){
//            s = s - 10*e;
            for(int f = 0; f <= s/5; f++){
//              s = s - 5*f;
              for(int g = 0; g <= s/2; g++){
//                s = s - 2*g;
                if(s - (a*200 + b*100 + c*50 + d*20 + e*10 + f*5 + g*2) >= 0){
                  counter++;
                }
                else{
                  break;
                }
              }
            }
          }
        }
      }
    }
  }
  print(counter);
}
