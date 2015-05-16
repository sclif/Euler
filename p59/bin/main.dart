import 'dart:io';

main(){
  int start = 97, limit = 123;
  Map<double, String> map = new Map<double, String>();
  List<int> bytes = readCipher();
  for(int a = start; a < limit; a++){
    for(int b = start; b < limit; b++) {
      for(int c = start; c < limit; c++){
        var plain = decipher(bytes, [a,b,c]);
        String s = new String.fromCharCodes(plain);
        double tStat = stat(s, "t") + stat(s, "T");
        double eStat = stat(s, "e") + stat(s, "E");
        double aStat = stat(s, "a") + stat(s, "A");
        double statKey = eStat + tStat + aStat;
        map[statKey] = s;
      }
    }
  }
  var stats = map.keys.toList();
  stats.sort();
  String text = map[stats.last];
  int result = text.codeUnits.reduce((a,b) => a+b);
  print(result);
}

List<int> readCipher(){
  List<int> result = [];
  String path = r'd:\Downloads\p059_cipher.txt';
  var f = new File(path);
  String s = f.readAsStringSync();
  s.split(",").forEach((a) => result.add(int.parse(a)));
  return result;
}

List<int> decipher(List<int> cipher, List<int> key){
  List<int> result = new List<int>(cipher.length);
  for(int i = 0; i < cipher.length; i++){
    result[i] = cipher[i]^key[i%key.length];
  }
  return result;
}

double stat(String text, String entry){
  int idx = -1, count = 0;
  do{
    idx = text.indexOf(entry, idx + 1);
    count++;
  }while(idx != -1);
  return (count - 1)/text.length;
}