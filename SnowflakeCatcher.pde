Snowflake[] snow;
int sNum = 100;

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
  for (int i = 0; i < snow.length; i++) {
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
  }
}
 void keyPressed() {
  
background(0);
  
}
void mousePressed()
{
  noStroke();
  fill(0,0,200);
  ellipse(mouseX, mouseY, 8, 8);
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
    noStroke();
    fill(255);
    ellipse(x, y, 5, 5);
  }
  void lookDown()
  {
    if (get(x, y+5) == color(0,0,200) || y > 400) {
      isMoving = false;
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


