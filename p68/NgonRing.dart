class NgonRing{
  List<int> innerRing;
  Map<int, int> outerRing;
  int overlap;

  NgonRing(this.innerRing, this.outerRing, this.overlap);

  int get average => _sum(innerRing, outerRing.keys, overlap) ~/ innerRing.length;

  bool isMagic(){
    int ave = average;
    for(int key in outerRing.keys){
      int nodeSum = key;
      int idx = outerRing[key];
      for(int i = 0; i < overlap; i++){
        nodeSum += innerRing[(i + idx) % innerRing.length];
      }
      if(nodeSum != ave){
        return false;
      }
    }
    return true;
  }

  int aveIfIAddSuchOuter(List<int> outer){
    int len = innerRing.length;
    if(outer.length != len){
      return false;
    }
    int totalSum = _sum(innerRing, outer, overlap);
    return totalSum % len == 0 ? totalSum ~/ len : -1;
  }

  String toString(){
    int min = innerRing.length * 2, minIdx = -1;
    for(int i = 0; i < outerRing.length; i++){
      var n = outerRing.keys.elementAt(i);
      if(n < min){
        min = n;
        minIdx = i;
      }
    }
    StringBuffer b = new StringBuffer();
    for(int i = 0; i < outerRing.length; i++){
      int key = outerRing.keys.elementAt((minIdx + i) % outerRing.length);
      b.write(key);
      int idx = outerRing[key];
      for(int j = 0; j < overlap; j++){
        b.write(innerRing[(j + idx) % innerRing.length]);
      }
    }
    return b.toString();
  }

  int _sum(List<int> ring, List<int> nodes, int o){
    return o*ring.reduce((a,b) => a+b) + nodes.reduce((a,b) => a+b);
  }
}