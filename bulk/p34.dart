List<int> prods = [];
Map<int, int> map;

int factorial(int n){
  int a = 1;
  for(int i = 2; i <= n; i++){
      a *= i;
  }
  return a;
}

bool containsAll(int n, List<int> digits){
	String s = n.toString();
	if(s.length != digits.length){
		return false;
	}
	int i = 0;
	do{
		String digit = digits[i++].toString();
		int idx = s.indexOf(digit);
		if(idx < 0){
			return false;
		}
		s = s.replaceFirst(digit, '');
	}while(s.length > 0);
	return true;
}

void r(int a, int sum, List<int> digits){
	//print(digits);
//        print(sum);
	if(digits.length > 7) return;
	for(int i = a; i < 10; i++){
		var l = new List.from(digits);
//      print(l);
		l.add(i);
		int s = sum + map[i];
		if(containsAll(s, l)){
			print(s);
			prods.add(s);
		}
		r(i, s, l);
	}
}

main(){
	var d = new List<int>.generate(10, (index) => index);
	map = new Map.fromIterable(d, key: (item) => item, value: (value) => factorial(value));
        print(map);
	for(int a = 0; a < 10; a++){
		int sum = map[a];
		print('$a started');
		r(a, sum, [a]);
	}
	print(new List.from(d));
	print('total: ${prods.reduce((a,b) => a+b)}');
}