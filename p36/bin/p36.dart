import 'package:euler/euler.dart';

// Prints a greeting.
void main() {
  int a = 5;
  int sum = 0;

  for(int n = 1; n < 1000000; n+=2){
    if(Word.isPalindrome(n.toRadixString(2)) && Word.isPalindrome(n.toString())){
      print("$n ${n.toRadixString(2)}");
      sum += n;
    }
  }
  print(Word.isPalindrome(a.toRadixString(2)));
  print(sum);
}