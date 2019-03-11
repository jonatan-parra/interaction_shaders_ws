Frame ground;
Frame cube_1, cube_2, cube_3, cube_4;
Frame cylinder_1;
Frame ring_1, ring_2;
Frame sphere_1, sphere_2;
Frame cone_1, cone_2, cone_3, cone_4, cone_5, cone_6, cone_7, cone_8;


void setup_elements() {
  //  O
  // x x
  //  x
  shape = loadShape("cubo.obj");
  shape.setTexture(img);
  cube_1 = new Shape(scene, shape);
  cube_1.setPosition(600,200,200);
  cube_1.setScaling(30);
  cube_1.setRotation(0,0,0,0);
  
  //  x
  // x O
  //  x
  cube_2 = new Shape(scene, shape);
  cube_2.setPosition(850,200,500);
  cube_2.setScaling(30);
  cube_2.setRotation(0,0,0,0);
  
  //  x
  // O x
  //  x
  cube_3 = new Shape(scene, shape);
  cube_3.setPosition(450,200,500);
  cube_3.setScaling(30);
  cube_3.setRotation(0,0,0,0);
  
  //  x
  // x x
  //  O
  cube_4 = new Shape(scene, shape);
  cube_4.setPosition(600,200,800);
  cube_4.setScaling(30);
  cube_4.setRotation(0,0,0,0);
  
  
  shape = loadShape("cilindro.obj");
  shape.setTexture(img);
  cylinder_1 = new Shape(scene, shape);
  cylinder_1.setPosition(1200,300,600);
  cylinder_1.setScaling(30);
  cylinder_1.setRotation(0,0,0,0);
  
  shape = loadShape("aro.obj");
  shape.setTexture(img);  
  ring_1 = new Shape(scene, shape);
  ring_1.setPosition(100,400,600);
  ring_1.setScaling(30);
  ring_1.setRotation(0,0,0,0);
  
  ring_2 = new Shape(scene, shape);
  ring_2.setPosition(1200,400,600);
  ring_2.setScaling(30);
  ring_2.setRotation(0,0,0,0);
  
  shape = loadShape("esfera.obj");
  shape.setTexture(img);  
  sphere_1 = new Shape(scene, shape);
  sphere_1.setPosition(250,300,500);
  sphere_1.setScaling(30);
  sphere_1.setRotation(0,0,0,0);
  
  sphere_2 = new Shape(scene, shape);
  sphere_2.setPosition(1100,300,1000);
  sphere_2.setScaling(30);
  sphere_2.setRotation(0,0,0,0);
    
  shape = loadShape("cono.obj");
  shape.setTexture(img);    
  // Conos delanteros  
  // xx
  // xO
  cone_1 = new Shape(scene, shape); 
  cone_1.setPosition(250,590,800);
  cone_1.setScaling(30);
  cone_1.setRotation(0,0,0,0);
  
  // xx
  // Ox
  cone_2 = new Shape(scene, shape);
  cone_2.setPosition(110,590,800);
  cone_2.setScaling(30);
  cone_2.setRotation(0,0,0,0);
  
  // Ox
  // xx
  cone_3 = new Shape(scene, shape);
  cone_3.setPosition(110,590,660);
  cone_3.setScaling(30);
  cone_3.setRotation(0,0,0,0);
  
  // xO
  // xx
  cone_4 = new Shape(scene, shape);
  cone_4.setPosition(250,590,660);
  cone_4.setScaling(30);
  cone_4.setRotation(0,0,0,0);
  
  // conos del fondo
  // xO
  // xx
  cone_5 = new Shape(scene, shape);
  cone_5.setPosition(1200,590,100);
  cone_5.setScaling(30);
  cone_5.setRotation(0,0,0,0);
  
  // Ox
  // xx
  cone_6 = new Shape(scene, shape);
  cone_6.setPosition(1060,590,100);
  cone_6.setScaling(30);
  cone_6.setRotation(0,0,0,0);
    
  // xx
  // Ox
  cone_6 = new Shape(scene, shape);
  cone_6.setPosition(1060,590,240);
  cone_6.setScaling(30);
  cone_6.setRotation(0,0,0,0);
  
  // xx
  // xO
  cone_6 = new Shape(scene, shape);
  cone_6.setPosition(1200,590,240);
  cone_6.setScaling(30);
  cone_6.setRotation(0,0,0,0);
  
  ground = new Shape(scene, loadShape("piso_1.obj"));
  ground.setPosition(670,720,600);
  ground.setScaling(80);
  ground.setRotation(PI,0,0,0);

}
