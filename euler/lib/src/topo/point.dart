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

  @override
  String toString(){
    return "$x:$y";
  }

  @override
  bool operator ==(o) => o is Point && o.x == this.x && o.y == this.y;

  @override
  int get hashCode => hash2(this.x.hashCode, this.y.hashCode);
}