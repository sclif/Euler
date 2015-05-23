import 'package:p61/p61.dart';

Map<int, List<N>> index = new Map<int, List<N>>();

main(){
  int d = 100, cycleLen = 6;
  var ns = generateAllNs(1000,10000);
  buildIndex(ns, d);
  removeDeadEnds(d);
  var result = findCycles(cycleLen, d);
  print(result.reduce((a,b) => a+b));
}

List<int> findCycles(int cycleLen, int d){
  for(var list in index.values){
    for(var n in list){
      var result = r([], n, cycleLen, d);
      if(result != null){
        List<int> ints = [];
        result.first.forEach((item) => ints.add(item.number));
        return ints;
      }
    }
  }
}

List<List<N>> r(List<N> list, N n, int len, int d){
  if(list.any((item) => item.ngonality == n.ngonality)){
    return null;
  }
  int finish = n.number.remainder(d);
  list.add(n);
  if(list.length == len){
    int start = list.first.number ~/ d;
    if(start == finish){
      return [list];
    }
    return null;
  }
  for(var next in index[finish]){
    var nextList = new List<N>.from(list);
    var result = r(nextList, next, len, d);
    if(result != null){
      return result;
    }
  }
  return null;
}

void removeDeadEnds(int d){
  for(var list in index.values){
    list.retainWhere((item) => index.containsKey(item.number.remainder(d)));
  }
}

void buildIndex(List<N> ns, int d){
  ns.sort((a,b) => a.number.compareTo(b.number));
  for(var n in ns){
    int idx = n.number ~/ d;
    if(index.containsKey(idx)){
      var list = index[idx];
      if(list.last.number == n.number){
        if(list.last.ngonality.index <= n.ngonality.index){
          list.removeLast();
        } else{
          continue;
        }
      }
      list.add(n);
    }
    else{
      index[idx] = [n];
    }
  }
}