library euler.word;

class Word{
  static int getAlphabeticValue(String s){
    return s.codeUnits.reduce((a,b) => a+b) - 64*s.length;
  }
}