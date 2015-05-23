library p61;

enum Ngonality{
  TRIANGLE,
  SQUARE,
  PENTAGON,
  HEXAGON,
  HEPTAGON,
  OCTAGON
}

class N{
  int number;
  Ngonality ngonality;

  N(this.number, this.ngonality);

  String toString(){
    return '$number: $ngonality';
  }
}

List<N> generateAllNs(int lowerLimit, int limit){
  List<N> ns = new List<N>();
  for(int i = 1;; i++){
    int a3 = triangle(i);
    if(a3 > lowerLimit){
      if(a3 >= limit){
        break;
      }
      ns.add(new N(a3, Ngonality.TRIANGLE));
    }

    int a4 = square(i);
    if(a4 > lowerLimit){
      if(a4 >= limit){
        continue;
      }
      ns.add(new N(a4, Ngonality.SQUARE));
    }
    
    int a5 = penta(i);
    if(a5 > lowerLimit){
      if(a5 >= limit){
        continue;
      }
      ns.add(new N(a5, Ngonality.PENTAGON));
    }

    int a6 = hexa(i);
    if(a6 > lowerLimit){
      if(a6 >= limit){
        continue;
      }
      ns.add(new N(a6, Ngonality.HEXAGON));
    }

    int a7 = hepta(i);
    if(a7 > lowerLimit){
      if(a7 >= limit){
        continue;
      }
      ns.add(new N(a7, Ngonality.HEPTAGON));
    }
    
    int a8 = octa(i);
    if(a8 > lowerLimit){
      if(a8 >= limit){
        continue;
      }
      ns.add(new N(a8, Ngonality.OCTAGON));
    }
  }
  return ns;
}

int triangle(int n){
  return (n * n + n) ~/ 2;
}

int square(int n){
  return n*n;
}

int penta(int n){
  return (n * (3 * n - 1)) ~/ 2;
}

int hexa(int n){
  return n * (2 * n - 1);
}

int hepta(int n){
  return (n * (5 * n - 3)) ~/ 2;
}

int octa(int n){
  return n * (3 * n - 2);
}