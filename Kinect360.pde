import queasycam.*;

//Libraries

import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

//Processing + 3rd party
PGraphics inputA;
PGraphics inputB;
PImage depthImageA;
PImage depthImageB;
Kinect2 kinectA;
Kinect2 kinectB;
color selectCol = color(100,200,255);

QueasyCam cam;

//My classes
Cloud cloudA;
Cloud cloudB;

//ControlWindow
Controller controls;

void settings() {
  size(512, 424, P3D);
  PJOGL.profile = 1;
}

void setup() {
  //cam = new QueasyCam(this);
  //cam.sensitivity = 0.1;
  //cam.speed = 1;
  //perspective(PI/3, (float)width/height, 0.01, 10000);
  controls = new Controller();
  stroke(255);
  strokeWeight(2);
  depthImageA = loadImage("data/depth.png");
  depthImageB = loadImage("data/depth.png");

  kinectA = new Kinect2(this);
  kinectA.initDepth();
  kinectA.initIR();
  kinectA.initVideo();
  kinectA.initDevice(0);

  kinectB = new Kinect2(this);
  kinectB.initDepth();
  kinectB.initIR();
  kinectB.initVideo();
  kinectB.initDevice(1);

  inputA = createGraphics(kinectA.depthWidth, kinectA.depthHeight, P3D);
  inputB = createGraphics(kinectB.depthWidth, kinectB.depthHeight, P3D);

  //My stuff
  cloudA = new Cloud(kinectA.depthWidth, kinectA.depthHeight, 4 );
  cloudB = new Cloud(kinectB.depthWidth, kinectB.depthHeight, 1);
}

float r;
float tempr;
void mRot() {

  if (mousePressed) {
    r = map(tempr, 0, width, 0, TWO_PI);
  } else {
    tempr = mouseX;
  }
}
void test(){
  image(kinectA.getDepthImage(), 0, 0, kinectA.depthWidth, kinectA.depthHeight);

  rotateY(PI);
  translate(-kinectA.depthWidth, 0);
  image(kinectB.getDepthImage(), 0, 0);
}
void draw() {
  //test();
  //translate(width/2 - kinectA.depthWidth/2,0);
  background(0);
  
  //float ry = mouseY - (height/2);
  //translate(mouseX,ry);
  //rotateY(HALF_PI+r);
  drawA();
  rotateY(PI);
  //drawB();
}

void drawA() {
  cloudA.scan(kinectA.getRawDepth(), 1);
}

void drawB() {
  cloudB.scan(kinectB.getRawDepth(), -1);
}