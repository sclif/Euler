import 'dart:io';
import 'dart:math';

main(){
  String path = r'd:\downloads\p067_triangle.txt';
  File f = new File(path);
  var strings = f.readAsLinesSync();
  List<List<int>> tri = [];
  strings.forEach((s){
    List<int> row = [];
    var numbers = s.split(" ");
    numbers.forEach((n) => row.add(int.parse(n)));
    tri.add(row);
  });

  int max = 0;
  for(int i = 0; i < tri.length; i++){
    var romb = buildRomb(tri, i);
    if(romb[tri.length - 1][0] > max){
      max = romb[tri.length - 1][0];
    }
  }
  print(max);
}

List<List<int>> buildRomb(List<List<int>> tri, int start){
  List<List<int>> romb = [];
  var r = new List<int>.filled(tri.length, 0);
  r[start] = tri[tri.length - 1][start];
  romb.add(r);
  int end = min(start + 1, tri.length - 1);
  start = max(start - 1, 0);
  for(int i = tri.length - 2; i >= 0; i--){
    var row = tri[i];
    var newrow = new List<int>.filled(i + 1, 0);
    for(int j = start; j < end; j++){
      var exrow = romb[romb.length - 1];

      int v = row[j] + max(exrow[j], exrow[j + 1]);
      newrow[j] = v;
    }
    romb.add(newrow);
    start = max(start - 1, 0);
    end = min(end, row.length - 1);
  }
  return romb;
}