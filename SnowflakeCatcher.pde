Snowflake[] snow;
int sNum = 100;
int water =0;
int ounces = 0;
void setup()
{
  background(0);
  size(600,400);

  snow = new Snowflake[sNum];
  for (int i = 0; i < snow.length; i++) {
    snow[i] = new Snowflake();
  }
}
void draw()
{
  background(0);
  fill(100);
  strokeWeight(3);
  stroke(200);
  quad(mouseX + 20, mouseY, mouseX - 20, mouseY, mouseX - 20, mouseY - 40, mouseX + 20, mouseY - 40);
  noStroke();
  fill(0,0,200);
  quad(mouseX + 18, mouseY, mouseX - 17, mouseY, mouseX - 17, mouseY - water, mouseX + 18, mouseY - water);
  fill(100);
  stroke(200);
  strokeWeight(3);
  ellipse(mouseX, mouseY - 40, 40, 10);
  for (int i = 0; i < snow.length; i++) {
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
  }
  noFill();
    stroke(200);
  strokeWeight(3);
  ellipse(mouseX, mouseY - 40, 40, 10);

    fill(255);
  textSize(20);
  text("Ounces of water collected:", 300,380);
  text(ounces, 565,380);
}
 void mousePressed() {
  
water = 0;
  
}


class Snowflake
{
  
  int x , y;
  boolean isMoving;  

  Snowflake()
  {
    x = (int)(Math.random()*600);
    y = (int)(Math.random()*400);
    isMoving = true;
  }
  void show()
  {
    if (isMoving == true){
    noStroke();
    fill(255);
    ellipse(x, y, 5, 5);
  }
  }
  void lookDown()
  {
    if (x > mouseX - 20 && mouseX + 20 > x && y == mouseY-3  || y > 400) {
      isMoving = false;
      x = 1000000;
      if (water <40) {
        water = water + 1;
        ounces = ounces + 1;
      }
      
    } else {
      isMoving = true;
    }
  }
  void erase()
  {
    fill(0);
    ellipse(x, y, 7, 7);
  }
  void move()
  {
    if (isMoving == true){
      y++;
    }
  }
  void wrap()
  {
    if (y > 399) {
      y = 0;
      x = (int)(Math.random()*600);
    }
  }
}


