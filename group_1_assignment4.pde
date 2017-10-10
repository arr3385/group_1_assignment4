BackgroundStar[] stars;

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

void setup() {
  size(1280, 720);
  stars = new BackgroundStar[500];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new BackgroundStar();
  }
}

void draw() {
  background(20);
  for (int i = 0; i < stars.length; i++) {
    stars[i].draw();
  }
}