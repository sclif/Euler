// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// The p51 library.
library p51;

Map<String, Set<int>> findDupes(String s){
  var tmp = new Map<String, Set<int>>();
  for(int i = 0; i < s.length; i++){
    var a = s[i];
    if(tmp.containsKey(a)){
      tmp[a].add(i);
    }else{
      var set = new Set<int>();
      set.add(i);
      tmp[a] = set;
    }
  }
  var result = new Map<String, Set<int>>();
  tmp.forEach((k,v) {
    if(v.length > 1){
      result[k] = v;
    }
  });
  return result;
}

List<String> buildTemplates(String s, Map<String, Set<int>> map) {
  List<String> result = [];
  map.forEach((k,v){
    for(int i = 0; i < v.length; i++){
      for(int j = i+1; j < v.length; j++){
        StringBuffer sb = new StringBuffer(s.substring(0, v.elementAt(i)));
        sb.write('*');
        sb.write(s.substring(v.elementAt(i) + 1, v.elementAt(j)));
        sb.write('*');
        sb.write(s.substring(v.elementAt(j) + 1));

        result.add(sb.toString());
      }
    }
  });
  return result;
}