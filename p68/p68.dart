import 'NgonRing.dart';

main(){
  // int overlap = 2;
  // int len = 3;
  // int innerRingMax = 6;
  // int outerRingMax = 6;

  int overlap = 2;
  int len = 5;
  int innerRingMax = 9;
  int outerRingMax = 10;

  var strings = getAllNotations(overlap, len, innerRingMax, outerRingMax);

  List<int> list = [];
  strings.forEach((s) => list.add(int.parse(s)));
  list.sort();

  print(list.last);
}

List<String> getAllNotations(int o, int depth, int irMax, orMax){
  var strings = [];
  for(int i = 1; i <= irMax - depth + 1; i++){
    var result = r([i], o, depth, irMax, orMax);
    if(result != null && result.length > 0){
      result.forEach((r) => strings.add(r));
    }
  }
  return strings;
}

Map<int,int> getOuterMap(List<int> inner, List<int> outer, int ave){
  int depth = inner.length;
  Map<int, int> map = new Map<int,int>();
  for(int j = 0; j < depth; j++){
    int diff = ave - inner[j] - inner[(j+1)%depth];
    if(outer.contains(diff)){
      map[diff] = j;
      outer.remove(diff);
    }else{
      if(map.length > 0){
      }
      return null;
    }
  }
  return map;
}

List<String> r(List<int> inner, int o, int depth, int irMax, int orMax){
  var strings = [];
  if(inner.length == depth){
    List<int> outer = new List<int>();
    for(int i = 1; i <= orMax; i++){
      if(!inner.contains(i)){
        outer.add(i);
      }
    }
    var ring = new NgonRing(inner, null, o);
    int ave = ring.aveIfIAddSuchOuter(outer);
    if(ave > 0){
      var permutations = getPermutations([], inner.first, inner);
      for(var permutation in permutations){
        var outerCopy = new List<int>.from(outer);
        var map = getOuterMap(permutation, outerCopy, ave);
        if(map != null){
          ring = new NgonRing(permutation, map, o);
          strings.add(ring.toString());
        }
      }
      return strings;
    } else{
      return null;
    }
  }
  for(int i = inner.last + 1; i <= irMax - depth + inner.length + 1; i++){
    var next = new List<int>.from(inner);
    next.add(i);
    var result = r(next, o, depth, irMax, orMax);
    if(result != null && result.length > 0){
      result.forEach((r) => strings.add(r));
    }
  }
  return strings;
}

List<List<int>> getPermutations(List<int> list, int item, List<int> ints){
  list.add(item);
  if(list.length == ints.length){
    return [list];
  }
  List<List<int>> result = new List<List<int>>();
  for(int i = 1; i < ints.length; i++){
    if(list.contains(ints[i])){
      continue;
    }
    List<int> next = new List<int>.from(list);
    var perms = getPermutations(next, ints[i], ints);
    perms.forEach((p) => result.add(p));
  }
  return result;
}