import 'package:euler/euler.dart';
import 'dart:async';
import 'Neo.dart';

Neo graph = new Neo();
Map<int,int> map = new Map();
int batchSize = 20;
int count = 0;
int maxLength = 0;
int targetLength = 60;

main() async {
  int limit = 1000000;
//  Cleanup();
  print(await ListCycle(69));

  CreateGraph(limit);
  FindCycles();
//  await Cleanup();
}

Future CreateGraph(int limit) async {
  for(int i = 71; i < limit; i++){
    await ListCycle(i);
//    AddCycle(list);
  }
//  graph.Add(map);
  print('max:$maxLength');
  print('count:$count');
}

Future<List<int>> ListCycle(int i) async{
  List<int> list = new List();
  int next = i;
  while(!list.contains(next)){
    list.add(next);
    next = Calc(next);
  }
  if(list.length > maxLength){
    maxLength = list.length;
  }
  if(list.length > 60){
    print('${list.length} long length was found: $list');
  }
  if(list.length == targetLength){
    print('${list.first}->...->${list.last}');
    count++;
  }
  return list;
}

Future AddCycle(List<int> ints){
  int backtrack = ints[0];
  for(int i = 1; i < ints.length; i++){
    map[backtrack] = ints[i];
    backtrack = ints[i];
  }
  if(map.length > batchSize){
    graph.Add(map);
    map.clear();
  }
}

void FindCycles(){
  //
}

void Cleanup(){
  graph.DeleteAll();
}

int Calc(int n){
  var digits = Number.getDigits(n);
  var sum = digits.fold(0, (a,b) => a + factorial(b));
  return sum;
}
/*

Future<bool> Exists(int n) async{
  int count = await graph.Count(n);
  return count > 0;
}*/
