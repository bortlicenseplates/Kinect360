class Controller extends PApplet{
  Controller(){
    super();
    PApplet.runSketch(new String[] {
      this.getClass().getSimpleName()
    }, this);
  }
  
  void settings() {
    size(500,600);
  }
  void setup(){
    background(0);
  }
  
  void draw(){
  }
  
  void addSlider(int x, int y, int w, int h, String label){
    SliderGroup.group.add(new Slider(x,y,w,h,label));
  }
  
  void drawButtons(){
    for (Slider s: sliders){
      lLim = s.run();
    }
  }
}

class Slider{
  int x, y, w, h;
  String label;
  float min, max, val;
  Slider(int _x, int _y, int _w, int _h, String _label){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    label = _label;
  }
  void create(){
    stroke(255);
    fill(200);
    rect(x,y,val,h);
    fill(150);
    rect(val,y,w,h);
  }
}

class Button{
  Button(){
  }
}

class SliderGroup{
  int vGap = 50;
  int hGap = 150;
  int w = 40;
  int h = 140;
  ArrayList <Slider> group;
  SliderGroup(String l, int s){
    create(l,s);
  }
  void create(String label, int sliderNum){
    group = new ArrayList<Slider>();
    for(int i = 0; i < sliderNum; i++){
      group.add(new Slider(0, i*hGap, w, h, label));                  
    }
  }
  
}