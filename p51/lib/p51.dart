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
    for(int limit = 2; limit <= v.length; limit++){
      for(int i = 0; i <= v.length - limit; i++) {
        var r = buildIndexes(limit, i, [], v);
        r.forEach((idx) => result.add(buildTemplate(s, idx)));
      }
    }
  });
  return result;
}

List<List<int>> buildIndexes(int len, int idx, List<int> list, Set<int> base){
  int next = base.elementAt(idx);
  list.add(next);
  if(list.length == len){
    return [list];
  }
  var result = new List<List<int>>();
  for(int i = idx + 1; i <= base.length - len + list.length; i++){
    var r = buildIndexes(len, i, new List<int>.from(list), base);
    r.forEach((item) => result.add(item));
  }
  return result;
}

String buildTemplate(String s, List<int> indexes){
  int i = 0;
  int start = 0;
  StringBuffer sb = new StringBuffer();
  do{
    int idx = indexes[i++];
    sb.write(s.substring(start, idx));
    sb.write('*');
    start = idx + 1;
  }while(i < indexes.length);
  sb.write(s.substring(start));
  return sb.toString();
}