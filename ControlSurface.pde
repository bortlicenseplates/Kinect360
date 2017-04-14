class Controller extends PApplet{
  ArrayList<SliderGroup> sliderGroups;
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
    sliderGroups = new ArrayList<SliderGroup>();
    background(0);
    createSliderGroups();
  }
  
  void draw(){
    background(255);
    for (SliderGroup g : sliderGroups){
      g.update();
    }
  }
  
  void createSliderGroups(){
    sliderGroups.add(new SliderGroup("Test",4, 20, 20));
  }
}
class SliderGroup{
  int x;
  int y;
  int vGap = 50;
  int hGap = 150;
  int w = 40;
  int h = 140;
  ArrayList <Slider> group;
  SliderGroup(String l, int s, int _x, int _y){
    x = _x;
    y = _y;
    create(l,s);
  }
  void create(String label, int sliderNum){
    pushMatrix();
    translate(x, y);
    group = new ArrayList<Slider>();
    for(int i = 0; i < sliderNum; i++){
      group.add(new Slider(0, i*hGap, w, h, label));              
    }
    popMatrix();
  }
  
  void update(){
    for (Slider s : group){
      s.create();
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