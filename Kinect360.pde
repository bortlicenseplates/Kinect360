//Libraries

import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
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

PeasyCam cam;

//My classes
Cloud cloud;


void settings(){
  size(1280, 720, P3D);
  PJOGL.profile = 1;
}

void setup() {
  depthImageA = loadImage("data/depth.png");
  depthImageB = loadImage("data/depth.png");
  
  kinectA = new Kinect2(this);
  kinectA.initDepth();
  kinectA.initIR();
  kinectA.initVideo();
  kinectA.initDevice();
  
  kinectB = new Kinect2(this);
  kinectB.initDepth();
  kinectB.initIR();
  kinectB.initVideo();
  kinectB.initDevice();
  
  inputA = createGraphics(kinectA.depthWidth, kinectA.depthHeight, P3D);
  inputB = createGraphics(kinectB.depthWidth, kinectB.depthHeight, P3D);
  
  //My stuff
  cloud = new Cloud
}


void draw(){
  background(0);
  drawA();
  drawB();
  image(inputA,0,0);
}

void drawA(){
  inputA.beginDraw();
  
  inputA.endDraw();
}

void drawB(){
  inputB.beginDraw();
  
  inputB.endDraw();
}