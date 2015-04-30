library euler.pandigital;

class Pandigital{
  static bool isPandigital(int n){
    String s = n.toString();
    if(s.length > 9){
      return false;
    }
    List<bool> f = new List<bool>(s.length);
    for(int i = 0; i < s.length; i++){
      int idx = s.codeUnitAt(i) - 49;
      if(idx < 0 || idx > s.length - 1 || f[idx]){
        return false;
      }
      f[idx]=true;
    }
    return true;
  }
}