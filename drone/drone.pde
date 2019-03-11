import frames.primitives.*;
import frames.core.*;
import frames.processing.*;

import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
ControlDevice device; // my SpaceNavigator
ControlSlider snXPos; // Positions
ControlSlider snYPos;
ControlSlider snXRot; // Rotations
ControlSlider snYRot;
ControlSlider snZFor;
ControlButton snZBac;//ControlSlider snZBac;
ControlButton buttonA;
ControlButton buttonB;
ControlButton buttonX;
ControlButton buttonY;
ControlButton buttonBack;
ControlButton buttonStart;
ControlButton LTrigger;
ControlButton RTrigger;
ControlButton LStickPress;
ControlButton RStickPress;

PShader selShader;

PShader diffSpecShader;
PShader diffSpecShaderVert;
PShader diffShader;
PShader diffShaderVert;

boolean movShip = true;
boolean thirdPer = false;
boolean camFlag = false;
int cntDwn = 30;

int movMult = 10;

Scene scene;

Frame ship;
PImage img;
PShape shape;

int Width = 1280;
int Height = 720;
int Depth = 1200;

void setup() {
  diffSpecShader = loadShader("texRefSpecfrag.glsl", "texRefSpecvert.glsl");
  diffSpecShaderVert = loadShader("vertRefSpecfrag.glsl", "vertRefSpecvert.glsl");
  diffShader = loadShader("texReffrag.glsl", "texRefvert.glsl");
  diffShaderVert = loadShader("vertReffrag.glsl", "vertRefvert.glsl");
  size(1000, 800, P3D);
  loadController();
  scene = new Scene(this);
  scene.setFrustum(new Vector(0, 0, 0), new Vector(Width, Height, Depth));
  scene.fit();
  img = loadImage("texture.jpg");
  shape = loadShape("heli1.obj");
  shape.setTexture(img);
  ship = new Shape(scene, shape);
  ship.setPosition(640,720,1200);
  ship.setScaling(1);
  ship.setRotation(0,0,0,0);
  setup_elements();
  
  selShader = diffShader;
}

void draw() {
  background(10, 50, 25);
  shader(selShader);
  //ambientLight(0, 0, 0);
  pointLight(255, 150, 150, 0,0,0);
  //pointLight(100, 100, 255, 1280,0,1200);
  walls();
  if(buttonB.pressed()){
    resetView();
  }
  if(buttonBack.pressed()){
    thirdPerson();
    camFlag = true;
  }
  if(camFlag){
    if(cntDwn == 0){
      cntDwn = 30;
      camFlag = false;
      scene.moveForward(60);
      scene.translate(0, 20, 0);
    }
    cntDwn = cntDwn - 1;
  }
  scene.traverse();
  float Z = snZFor.getValue() - snZBac.getValue();
  if(thirdPer)
    movMult = 50;
  else
    movMult = 10;
  if(movShip){
    scene.translate(movMult * snXPos.getValue(), movMult * snYPos.getValue(), 5*Z, ship);
    scene.rotate(-snXRot.getValue() * 20 * PI / width, -snYRot.getValue() * 20 * PI / width, 0, ship);
  }else{
    scene.translate(10 * snXPos.getValue(), 10 * snYPos.getValue(), -5*Z);
    scene.rotate(-snXRot.getValue() * 20 * PI / width, -snYRot.getValue() * 20 * PI / width, 0);
  }
}

void walls() {
  pushStyle();
  noFill();
  stroke(255, 255, 0);

  line(0, 0, 0, 0, Height, 0);
  line(0, 0, Depth, 0, Height, Depth);
  line(0, 0, 0, Width, 0, 0);
  line(0, 0, Depth, Width, 0, Depth);

  line(Width, 0, 0, Width, Height, 0);
  line(Width, 0, Depth, Width, Height, Depth);
  line(0, Height, 0, Width, Height, 0);
  line(0, Height, Depth, Width, Height, Depth);

  line(0, 0, 0, 0, 0, Depth);
  line(0, Height, 0, 0, Height, Depth);
  line(Width, 0, 0, Width, 0, Depth);
  line(Width, Height, 0, Width, Height, Depth);
  popStyle();
}

void mouseMoved() {
  scene.cast();
}

void mouseDragged() {
  if (mouseButton == LEFT)
    scene.spin();
  else if (mouseButton == RIGHT)
    scene.translate();
  else
    scene.scale(scene.mouseDX());
}

void mouseWheel(MouseEvent event) {
  scene.moveForward(event.getCount() * 20);
}

void resetView(){
    thirdPer = false;
    scene.eye().resetReference();
    scene.lookAt(scene.center());
    scene.fit(1);
}

void resetShip(){
   ship.setPosition(640,720,1200);
   resetShipRot();
}

void resetShipRot(){
  ship.setRotation(0,0,0,0);
}

void thirdPerson(){
  thirdPer = true;
  movShip = true;
  resetShipRot();
  scene.eye().setReference(ship);
  scene.fit(ship, 1);
}

void changeRef(){
  if(!thirdPer){
  movShip = !movShip;
  }
}

void rotateLeft(){
  if(movShip){
    scene.rotate(0, 0, -5*PI / width, ship);
  }else{
    scene.rotate(0, 0, -5*PI / width);
  }
}

void rotateRight(){
  if(movShip){
    scene.rotate(0, 0, 5*PI / width, ship);
  }else{
    scene.rotate(0, 0, 5*PI / width);
  }
}

void loadController() {
  control = ControlIO.getInstance(this);
  device = control.getDevice(0);
  if (device == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW!
  }
  snXPos = device.getSlider(0);
  snXPos.setTolerance(0.1);
  snYPos = device.getSlider(1);
  snYPos.setTolerance(0.1);
  snXRot = device.getSlider(4);
  snXRot.setTolerance(0.1);
  snYRot = device.getSlider(3);
  snYRot.setTolerance(0.1);
  snZFor = device.getSlider(2);
  snZFor.setTolerance(0.1);
  snZBac = device.getButton(5);//snZBac = device.getSlider(5);
  snZBac.setTolerance(0.1);
  buttonB = device.getButton(1);
  //buttonB.plug("resetView", 0);
  buttonX = device.getButton(2);
  buttonX.plug("resetShip", 0);
  buttonY = device.getButton(3);
  buttonY.plug("changeRef", 0);
  buttonBack = device.getButton(6);
  //buttonBack.plug("thirdPerson", 0);
  buttonStart = device.getButton(7);
  LTrigger = device.getButton(4);
  LTrigger.plug("rotateLeft", 2);
  RTrigger = device.getButton(5);
  RTrigger.plug("rotateRight", 2);
  LStickPress = device.getButton(9);
  RStickPress = device.getButton(10);
  RStickPress.plug("resetShipRot", 0);

}

void keyPressed() {
  if(key == 'a'){
    //Diffuse ligth
    selShader = diffShader;
  }else if (key == 'd'){
    //Diffuse and Specular ligth
    selShader = diffSpecShader;
  }else if (key == 'z'){
    //Diffuse and Specular ligth
    selShader = diffShaderVert;
  }else if (key == 'c'){
    //Diffuse and Specular ligth
    selShader = diffSpecShaderVert;
  }
}