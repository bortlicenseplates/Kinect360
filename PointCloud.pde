class Cloud implements IControls {
  int skip, pLim;
  int w, h;
  
  float x, y, z;
  float lLim, uLim;
  ArrayList<PVector> points;
  Cloud(int _w, int _h) {
    w = _w;
    h = _h;
    points = new ArrayList<PVector>();
  }

  void scan(int[] pxls) {
    for (int i = 0; i < pxls.length; i++) {
      if (brightness(pxls[i]) > lLim && brightness(pxls[i]) < uLim && points.size() < pLim) {
        points.add(new PVector(i%w, (int)Math.floor(i/w), brightness(pxls[i])));
      }
    }
  }
  
  void create(){ 
    for (point
  }
}