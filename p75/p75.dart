import 'PyTriple.dart';

List<int> ps = new List();
Map<int, int> counts = new Map();
int limit = 1500000;

void main(){
  PyTriple triple = new PyTriple(3,4,5);
  ps.add(triple.p());

  process(triple);

  calculateCounts();

  print(counts.values.where((c) => c == 1).length);
}

void process(PyTriple t){
  if(t.p() > limit){
    return;
  }
  var list = t.next();
  addCheck(list[0].p());
  addCheck(list[1].p());
  addCheck(list[2].p());

  process(list[0]);
  process(list[1]);
  process(list[2]);
}

void calculateCounts(){
  ps.forEach((p) {
    int tmp = p;
    do{
      if(counts.containsKey(tmp)){
        counts[tmp]++;
      }else{
        counts[tmp] = 1;
      }
      tmp += p;
    }while(tmp <= limit);
  });
}

void addCheck(int p){
  if(p <= limit){
    if(!ps.contains(p)) {
      ps.add(p);
    }
  }
}