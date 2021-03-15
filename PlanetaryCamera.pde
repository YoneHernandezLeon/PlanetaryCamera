float ralosAng, karaAng, arteirAng, tarsAng, pentnunAng, surnauAng, surnaumoonAng, tolupAng, acridAng, acridmoonAng, viewX, viewY, viewZ, posX, posY, posZ, alpha, beta, r;

PImage ralosTex, karaTex, arteirTex, tarsTex, moonTex, pentnunTex, surnauTex, tolupTex, acridTex, bgTex, shipTex;

PShape ralos, kara, arteir, tars, pentnun, surnau, surnaumoon, tolup, acrid, acridmoon, ship;

PFont font;

boolean orbits, firstPersonEnabled, rotateLeft, rotateRight, rotateUp, rotateDown, forward, backwards;

void setup()
{
  size(1080, 702, P3D);
  stroke(0);

  orbits = true;
  firstPersonEnabled = false;
  rotateLeft = false;
  rotateRight = false;
  rotateUp = false;
  rotateDown = false;
  forward = false;
  backwards = false;

  font = createFont("Starjedi.ttf", 32);
  textFont(font);
  textAlign(CENTER);
  textSize(30);

  ralosTex = loadImage("ralos.png");
  karaTex = loadImage("kara.png");
  arteirTex = loadImage("arteir.png");
  tarsTex = loadImage("tars.png");
  surnauTex = loadImage("surnau.jpg");
  pentnunTex = loadImage("pentnun.jpg");
  tolupTex = loadImage("tolup.jpg");
  acridTex = loadImage("acrid.jpg");

  moonTex = loadImage("moon.png");
  bgTex = loadImage("background.jpg");

  shipTex = loadImage("deathstar.png");

  ralos = generatePlanet(ralosTex, 100);
  kara = generatePlanet(karaTex, 10);
  arteir = generatePlanet(arteirTex, 15);
  tars = generatePlanet(tarsTex, 20);
  surnau = generatePlanet(surnauTex, 35);
  surnaumoon = generatePlanet(moonTex, 7);
  pentnun = generatePlanet(pentnunTex, 27);
  tolup = generatePlanet(tolupTex, 10);
  acrid = generatePlanet(acridTex, 30);
  acridmoon = generatePlanet(moonTex, 7);

  ship = generatePlanet(shipTex, 20);

  ralosAng = 0;
  karaAng = 0;
  viewX = 1;
  viewZ = 0;
  viewY = 0;
  posX = 0;
  posY = height/2.0;
  posZ = -650;
  alpha = 0;
  beta = 0;
  r = 1;
}
void draw()
{
  background(bgTex);

  if (firstPersonEnabled) {

    rotateShip();
    modifyView();
    if (forward) {
      posX += viewX * 2;
      posY += viewY * 2;
      posZ += viewZ * 2;
    } 
    if (backwards) {
      posX -= viewX * 2;
      posY -= viewY * 2;
      posZ -= viewZ * 2;
    }
    
    camera(posX, posY, posZ, viewX + posX, viewY + posY, viewZ + posZ, 0, 1, 0);
    translate(width/2, height/2, -650);
    
  } else {

    camera();
    textSize(13);
    textAlign(LEFT);
    text("Press tab to toggle between panoramic and\nfirst person camera.\nPress up, down, left and right to rotate the camera.\nPress space to go forward.\nPress control to go backwards.\nPress shift to toggle the orbit display.\nPress r to reset ship position.", 10, 20);
    translate(width/2, height/2, -650);
    float mY = (float) mouseY;
    float mX = (float) mouseX;
    float h = (float) height;
    float w = (float) width;
    rotateX(radians(((mY/h) * -90) + 45));
    rotateY(radians(((mX/w) * 130) - 65));

    pushMatrix();
    translate(posX - width/2, posY - height/2, posZ + 650);
    rotateY(alpha + 90);
    shape(ship);
    popMatrix();
  }

  if (orbits) {
    pushMatrix();
    noFill();
    stroke(100);
    rotateX(radians(90));
    circle(0, 0, 400);
    circle(0, 0, 494.97);
    circle(0, 0, 1200);
    popMatrix();

    pushMatrix();
    noFill();
    stroke(100);
    rotateY(radians(90));
    circle(0, 0, 300);
    circle(0, 0, 1050);
    circle(0, 0, 700);
    popMatrix();

    pushMatrix();
    noFill();
    stroke(100);
    circle(0, 0, 900);
    popMatrix();
  }
  displayRotations();
  updateAng();
}

void keyPressed() {
  if (keyCode == LEFT) {
    rotateLeft = true;
  } else if (keyCode == RIGHT) {
    rotateRight = true;
  } else if (keyCode == UP) {
    rotateUp = true;
  } else if (keyCode == DOWN) {
    rotateDown = true;
  } else if (keyCode == CONTROL) {
    backwards = true;
  } else if (key == ' ') {
    forward = true;
  }
}

void keyReleased() {
  if (key == TAB) {
    firstPersonEnabled = !firstPersonEnabled;
  } else if (keyCode == SHIFT) {
    orbits = !orbits;
  } else if (keyCode == LEFT) {
    rotateLeft = false;
  } else if (keyCode == RIGHT) {
    rotateRight = false;
  } else if (keyCode == UP) {
    rotateUp = false;
  } else if (keyCode == DOWN) {
    rotateDown = false;
  } else if (keyCode == CONTROL) {  
    backwards = false;
  } else if (key == ' ') {
    forward = false;
  } else if (key == 'r') {
    viewX = 1;
    viewZ = 0;
    viewY = 0;
    posX = 0;
    posY = height/2.0;
    posZ = -650;
    alpha = 0;
    beta = 0;
    r = 1;
  }
}

PShape generatePlanet(PImage tex, int size) {
  beginShape();
  PShape aux = createShape(SPHERE, size);
  aux.setStroke(255);
  aux.setTexture(tex);
  endShape(CLOSE);

  return aux;
}

void updateAng() {
  ralosAng = ralosAng + 0.15;
  if (ralosAng > 360) ralosAng = 0;

  karaAng = karaAng - 0.55;
  if (karaAng < -360) karaAng = 0;

  arteirAng = arteirAng + 0.2;
  if (arteirAng > 360) arteirAng = 0;

  tarsAng = tarsAng - 0.5;
  if (tarsAng < -360) tarsAng = 0;

  surnauAng = surnauAng + 0.66;
  if (surnauAng > 360) surnauAng = 0;

  surnaumoonAng = surnaumoonAng - 1;
  if (surnaumoonAng < -360) surnaumoonAng = 0;

  pentnunAng = pentnunAng - 0.25;
  if (pentnunAng < -360) pentnunAng = 0;

  tolupAng = tolupAng + 0.45;
  if (tolupAng > 360) tolupAng = 0;

  acridAng = acridAng - 0.4;
  if (acridAng < -360) acridAng = 0;

  acridmoonAng = acridmoonAng + 1.25;
  if (acridmoonAng > 360) acridmoonAng = 0;
}

void displayRotations() {
  textSize(30);
  textAlign(CENTER);

  pushMatrix();
  rotateY(radians(ralosAng));
  shape(ralos);
  rotateY(radians(-ralosAng));
  text("Ralos", 0, -120);
  popMatrix();

  textSize(20);

  pushMatrix();
  rotateX(radians(karaAng));
  translate(0, -150, 0);
  rotateX(radians(-karaAng));
  text("Kara", 0, -20);
  shape(kara);
  popMatrix();

  pushMatrix();
  rotateY(radians(arteirAng));
  translate(200, 0, 0);
  rotateY(radians(-arteirAng));
  text("Arteir", 0, -25);
  shape(arteir);
  popMatrix();

  pushMatrix();
  rotateY(radians(tarsAng));
  translate(175, 0, -175);
  rotateY(radians(-tarsAng));
  text("Tars", 0, -30);
  shape(tars);
  popMatrix();

  pushMatrix();
  rotateX(radians(surnauAng));
  translate(0, 350, 0);
  rotateX(radians(-surnauAng));
  text("Surnau", 0, -45);
  shape(surnau);
  rotateX(radians(surnaumoonAng));
  rotateZ(radians(surnaumoonAng));
  translate(0, 0, 50);
  shape(surnaumoon);
  popMatrix();

  pushMatrix();
  rotateZ(radians(pentnunAng));
  translate(450, 0, 0);
  rotateZ(radians(-pentnunAng));
  text("Pentnun", 0, -37);
  shape(pentnun);
  popMatrix();

  pushMatrix();
  rotateX(radians(tolupAng));
  translate(0, 0, -525);
  rotateX(radians(-tolupAng));
  text("Tolup", 0, -20);
  shape(tolup);
  popMatrix();

  pushMatrix();
  rotateY(radians(acridAng));
  translate(-600, 0, 0);
  rotateY(radians(-acridAng));
  text("Acrid", 0, -40);
  shape(acrid);
  rotateY(radians(acridmoonAng));
  translate(0, 0, 45);
  shape(acridmoon);
  popMatrix();
}

void rotateShip() {
  if (rotateLeft) {
    alpha += 0.01;
  }
  if (rotateRight) {
    alpha -= 0.01;
  }
  if (rotateUp) {
    beta -= 0.01;
  }
  if (rotateDown) {
    beta += 0.01;
  }
  if (alpha >= 360) {
    alpha = 0;
  }
  if (beta > 45) {
    beta = 45;
  } else if (beta < -45) {
    beta = -45;
  }
}

void modifyView() {

  viewY = sin(beta); 
  r = cos(beta);

  if (alpha < 90) {
    viewX = cos(alpha) * r;
    viewZ = -(sin(alpha) * r);
  } else if (alpha < 180) {
    viewX = -(sin(alpha - 90) * r);
    viewZ = -(cos(alpha - 90) * r);
  } else if (alpha < 270) {
    viewX = -(cos(alpha - 180) * r);
    viewZ = sin(alpha - 180) * r;
  } else {
    viewX = sin(alpha - 270) * r;
    viewZ = cos(alpha - 270) * r;
  }
}
