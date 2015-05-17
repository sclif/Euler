main(){
	int a = 3, b = 2, limit = 999;
	int count = 0;
	for(int i = 0; i < limit; i++){
		var aNext = _a(a,b);
		var bNext = _b(a,b);
		if(isLonger(aNext, bNext)){
			count++;
		}
		a = aNext;
		b = bNext;
	}
	print(count);
}

int _a(int a, int b){
	return a + 2*b;
}

int _b(int a, int b){
	return a + b;
}

int _baseline = 1;

bool isLonger(int a, int b){
	while(a > _baseline && b > _baseline){
		_baseline *= 10;
	}
	
	return a > _baseline && b < _baseline;
}