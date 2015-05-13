library euler.word;

class Word{
  static int getAlphabeticValue(String s){
    return s.codeUnits.reduce((a,b) => a+b) - 64*s.length;
  }

  static bool isPalindrome(String s){
    for(int i = 0;i<s.length/2;i++)
    {
      if(s[i] != s[s.length - i -1]) return false;
    }
    return true;
  }
}