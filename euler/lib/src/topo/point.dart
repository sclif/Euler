class Point{
  int x;
  int y;

  Point(this.x, this.y);

  static Point zero(){
    return new Point(0,0);
  }

  Point right(){
    return new Point(x + 1, y);
  }

  Point left(){
    return new Point(x - 1, y);
  }

  Point up(){
    return new Point(x, y - 1);
  }

  Point down(){
    return new Point(x, y + 1);
  }

  String toString(){
    return "$x:$y";
  }
}