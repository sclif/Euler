library euler.pandigital;

class Pandigital{
  static bool isPandigital(int n){
    String s = n.toString();
    List<bool> f = new List<bool>(9);
    for(int i = 0; i < s.length; i++){
      int idx = s.codeUnitAt(i) - 49;
      if(f[idx]){
        return false;
      }
      f[idx]=true;
    }
    return true;
  }
}