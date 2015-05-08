int a = 5;
int sum = 0;

bool IsPalindrome(String s){
  for(int i = 0;i<s.length/2;i++)
  {
    if(s[i] != s[s.length - i -1]) return false;
  }
  return true;
}

// Prints a greeting.
void main() {
  for(int n = 1; n < 1000000; n+=2){
    if(IsPalindrome(n.toRadixString(2)) && IsPalindrome(n.toString())){
      print("$n ${n.toRadixString(2)}");
      sum += n;
    }
  }
  print(IsPalindrome(a.toRadixString(2)));
  print(sum);
}