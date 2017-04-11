import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

PGraphics inputA;
PGraphics inputB;
PImage depthImageA;
PImage depthImageB;
Kinect2 kinectA;
Kinect2 kinectB;

PeasyCam cam;

void setup() {
  depthImageA = loadImage("data/depth.png");
  depthImageB = loadImage("data/depth.png");
  size(1280, 720, P3D);
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
  
  inputA = createGraphics(kinectA.depthWidth, kinectA.depthHeight);
  inputB = createGraphics(kinectB.depthWidth, kinectB.depthHeight);
}


void draw(){
  background(0);
  inputA.image(depthImageA, 0, 0, inputA.width, inputA.height);
  inputB.image(depthImageB, 0, 0, inputB.width, inputB.height);
}