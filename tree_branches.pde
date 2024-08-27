class Branch {
  PVector pos;
  float a;
  int i;
  int k;
  Branch next = null;
  
  Branch(PVector pos, float a, int i, int k) {
    this.pos = pos;
    this.a = a;
    this.i = i;
    this.k = k;
    
    if (i < k) {
      this.next = new Branch(
        PVector.fromAngle(a).setMag(random(2, 15)).add(pos),
        a + random(-QUARTER_PI, QUARTER_PI),
        i + 1,
        k
      );
    }
  }
  
  void show(int a) {
    if (next != null) {
      stroke(gradient(i, k), a);
      strokeWeight(1);
      line(pos.x, pos.y, next.pos.x, next.pos.y);
      
      next.show(a);
    }
  }
}

color[] COLORS = {
  #9b5de5,
  #f15bb5,
  #fee440,
  #00bbf9,
  #00f5d4
};
Branch b;

void setup() {
  size(900, 900);
  background(255);
  //b = new Branch(
  //  new PVector(width / 2, height / 2),
  //  random(0, TWO_PI),
  //  0,
  //  50
  //);
  //b.show(255);
}

void draw() {
  for (int j = 0; j < 50; j++) {
    b = new Branch(
      new PVector(width / 2, height / 2),
      random(0, TWO_PI),
      0,
      (int) random(10, 50)
    );
    b.show(10);
  }
}


color gradient(int i, int k) {
  int countPerColor = (k / COLORS.length);
  int index = (int) map(i, 0, k, 0, COLORS.length - 1);
  color c1 = COLORS[index];
  color c2 = COLORS[index + 1];
  return lerpColor(c1, c2, map(i, index * countPerColor, index * countPerColor + countPerColor, 0, 1));
}
