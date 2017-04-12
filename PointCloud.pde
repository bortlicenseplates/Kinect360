float lLim=0, uLim=1000000000;
int dir;
int skip, pLim;
int w, h;
int activeX, activeY, activeW, activeH;
int selector;
class Cloud {
  
  ArrayList<PVector> points;
  Cloud(int _w, int _h, int _skip) {
    activeW = width;
    activeH = height;
    w = _w;
    h = _h;
    skip = _skip;
    points = new ArrayList<PVector>();
  }
  boolean t = true;
  void select() {
   
    if (mousePressed && t) {
      selector++;
      t=false;
    }
    if (!mousePressed) {
      t = true;
    }
    if (selector%3 == 1) {
      activeX = mouseX*dir;
      activeY = mouseY*dir;
      selector ++;
    } else if (selector%3 == 2) {
      activeW = mouseX*dir-activeX;
      activeH = mouseY*dir-activeY;
    } else {
      selector = 0;
      //int[] tx = normalise(activeX,activeW);
      //int[] ty = normalise(activeY,activeH);
      //activeX = tx[0];
      //activeY = ty[0];
      //activeW = tx[1];
      //activeH = ty[1];
    }
    
    pushStyle();

    noFill();

    rect(activeX, activeY, activeW, activeH);
    popStyle();
  }
  int[] normalise(int a, int b){
    if (b > a){
      return new int[]{a, b};
    }
    return new int[]{b, a};
  }
  int y = 0;
  void scan(int[] depth, int _dir) {
    dir = _dir;
    println(selector);
    select();
    pushMatrix();
    if (dir == -1) {
      translate(-w, 0, -462);
    }
    for (int i = 0; i < depth.length; i+=skip) {
      int x = i%(512);
      if (i>0 && i%w == 0){
        y+= skip/2;
      }
      //int y =(int) map((i-x)/(512),0,h,0,height);
      if (x > activeX && x < activeW+activeX &&
          y > activeY && y < activeH+activeY &&
          (depth[i]) > lLim &&
          (depth[i]) < uLim) {
        point(x, y);
      }
    }
    y = 0;
    popMatrix();
  }
}