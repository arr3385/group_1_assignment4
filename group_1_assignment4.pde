BackgroundStar[] stars;
shootingStar[] shootingStar;

public class BackgroundStar {
  int x, y, frame, speed;
  double radius, distance;
  public double baseSpeed = 10;
  BackgroundStar() {
    x = (int)(Math.random() * 1280);
    y = (int)(Math.random() * 720);
    distance = Math.random() * 5 + 1;
    radius = 3 / distance;
    speed = (int)(baseSpeed * distance);
    frame = 0;
  }
  
  public void draw() {
    // Draw
    stroke(255);
    float twinkledRadius = (float)(Math.random() * radius);
    ellipse((int)x,(int) y, twinkledRadius, twinkledRadius);
    
    // Updates
    if (frame % (int)(speed) == 0) {
      x += 1;
    }
    if (x > 1280) {
      x = 0;
    }
    if (frame % (int)(2 * speed) == 0) {
      y -= 1;
    }
    if (y < 0) {
      y = 720;
    }
    frame++;
  }

}

public class shootingStar extends BackgroundStar {
    int tail_length = 10;
    public void drawtail() {
      color tail_color = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
      stroke(tail_color);
      //4 long tails
      line(int(x),int(y), int(x) - tail_length*((cos(x)+sin(x))), int(y)+ tail_length*(cos(x)-sin(x)));
      line(int(x),int(y), int(x) + tail_length*((cos(x)+sin(x))), int(y)- tail_length*(cos(x)-sin(x)));
      line(int(x),int(y), int(x) - tail_length*((cos(x+.5*PI)+sin(x+.5*PI))), int(y)+ tail_length*(cos(x+.5*PI)-sin(x+.5*PI)));
      line(int(x),int(y), int(x) - tail_length*((cos(x-.5*PI)+sin(x-.5*PI))), int(y)+ tail_length*(cos(x-.5*PI)-sin(x-.5*PI)));
      //4 short tails
      line(int(x),int(y), int(x) - .5*tail_length*((cos(x+.75*PI)+sin(x+.75*PI))), int(y)+ .5*tail_length*(cos(x+.75*PI)-sin(x+.75*PI)));
      line(int(x),int(y), int(x) - .5*tail_length*((cos(x+.25*PI)+sin(x+.25*PI))), int(y)+ .5*tail_length*(cos(x+.25*PI)-sin(x+.25*PI)));
      line(int(x),int(y), int(x) - .5*tail_length*((cos(x+1.25*PI)+sin(x+1.25*PI))), int(y)+ .5*tail_length*(cos(x+1.25*PI)-sin(x+1.25*PI)));
      line(int(x),int(y), int(x) - .5*tail_length*((cos(x+1.75*PI)+sin(x+1.75*PI))), int(y)+ .5*tail_length*(cos(x+1.75*PI)-sin(x+1.75*PI)));
    }
}

void setup() {
  size(1280, 720);
  stars = new BackgroundStar[500];
  shootingStar = new shootingStar[20];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new BackgroundStar();
  }
  for (int j = 0; j < shootingStar.length; j++) {
    shootingStar[j] = new shootingStar();
  }
}

void draw() {
  background(20);
  for (int i = 0; i < stars.length; i++) {
    stars[i].draw();
  }
  for (int j = 0; j < shootingStar.length; j++){
    shootingStar[j].drawtail();
    shootingStar[j].draw();
  }
}
