
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  //height,width
  int h, w;
  float [] values;
  float [] speeds;
  //initialization x, y, length of array, height, width
  Visualizer(float x, float y, int variableSize, int h, int w) {
    this.x = x;
    this.y = y;
    values = new float[variableSize];
    speeds = new float[variableSize];
    this.h = h;
    this.w = w;
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-(h/2)-1, (h/2)-1);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    //drawing the box
    rect(x, y, w, h);

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+(h/2), x+w, y+(h/2));

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    //THESE ARE WRONG: They just illustrate how they could look
    //fill(255, 0, 0);
    //rect(x+40, y+100, 60, 50);
    //fill(0, 255, 0);
    //rect(x+120, y+50, 60, 50);
    int widthBar = w / values.length;
    for (int i = 0; i < values.length; i++) {
      //gradient of red
      //rectangle starting at bottom left, -value bc positive is down in the processing grid while negative is up
      if (Math.abs(values[i]) >= 0 && Math.abs(values[i]) <= (h/5)) {
        fill(255, 0, 0);
        rect(x + widthBar * i, y + (h/2), widthBar, -values[i]);
      } else if (Math.abs(values[i]) > (h/5) && Math.abs(values[i]) <= ((2*h)/5)) {
        fill(200, 0, 0);
        rect(x + widthBar * i, y + (h/2), widthBar, -values[i]);
      } else if (Math.abs(values[i]) > (2*h/5) && Math.abs(values[i]) <= ((3*h)/5)) {
        fill(150, 0, 0);
        rect(x + widthBar * i, y + (h/2), widthBar, -values[i]);
      } else if (Math.abs(values[i]) > (3*h/5) && Math.abs(values[i]) <= ((4*h)/5)) {
        fill(100, 0, 0);
        rect(x + widthBar * i, y + (h/2), widthBar, -values[i]);
      } else {
        fill(50, 0, 0);
        rect(x + widthBar * i, y + (h/2), widthBar, -values[i]);
      }
    }
    //Width of the visualizer is 400!
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min
      if (values[i] >= (h/2)|| values[i] <= -(h/2)) {
        speeds[i] *= -1;
      }
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20, 10, 400, 400);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
