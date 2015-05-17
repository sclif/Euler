import 'dart:io';
import 'dart:convert';

Map<String, Set<String>> _cand = new Map<String, Set<String>>();

main(){
  int limit = 9, cycleLen = 5;
  var db = new Map<int, Set<String>>();

  String path = r'd:\data\1400000000-primes.txt';
  File f = new File(path);
  var stream = f.openRead();
  stream
    .transform(UTF8.decoder)
    .transform(new LineSplitter())
    .takeWhile((value) => value.length < limit)
    .listen((a) {
      _checkCandidacy(db, a);

      int key = a.length;
      if(db.containsKey(key)){
        db[key].add(a);
      }else{
        var set = new Set<String>();
        set.add(a);
        db[key] = set;
      }
    }, onDone: (){
      List<int> result = [];
      var cycle = _findCycle(cycleLen);
      cycle.forEach((c) {
        int sum = 0;
        c.forEach((item) => sum += int.parse(item));
        result.add(sum);
      });
      result.sort();
      print(result[0]);
    });
}

void _checkCandidacy(Map<int, Set<String>> db, String s){
  for(int i = 1; i < s.length; i++){
    var setP = db[i];
    String p = s.substring(0, i);
    if(setP.contains(p)){
      var setQ = db[s.length - i];
      String q = s.substring(i);
      if(setQ.contains(q)){
        var r = (q+p);
        if(r.compareTo(s) == -1 && db[r.length].contains(r))
        {
          _addPair(p, q);
        }
      }
    }
  }
}

void _addPair(String p, String q){
  _add(p,q);
  _add(q,p);
}

void _add(String p, String q){
  if(_cand.containsKey(p)){
    _cand[p].add(q);
  } else {
    _cand[p] = [q];
  }
}

List<List<String>> _findCycle(int len){
  var result = [];
  _cand.forEach((k,v) {
    if(v.length >= len){
      for(String s in v){
        var l = [k, s];
        var r = _find(s, l, len);
        if(r != null && r.length > 0){
          r.forEach((item) => result.add(item));
        }
      }
    }
  });
  return result;
}

List<List<String>> _find(String s, List<String> l, int len){
  var set = _cand[s];
  if(set.length < len){
    return null;
  }
  for(String t in l){
    if(s != t && !set.contains(t)){
      return null;
    }
  }
  if(l.length == len){
    return [l];
  }
  var result = [];
  for(String k in set){
    if(l.contains(k)){
      continue;
    }
    var next = new List<String>.from(l);
    next.add(k);
    var r = _find(k, next, len);
    if(r != null && r.length > 0){
      r.forEach((item) => result.add(item));
    }
  }
  return result;
}