int levels;
color bg, fg;

void setup() {
  size(800, 600);
  levels = 1;
}

/*Create Pascal's Gasket (google an image of this)
 The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
 levels:
 0 = regular triangle
 1 = triforce (looks like 3 triangles)
 2 = each of the 3 triangles will be cut into 3 triangles.
 etc.
 */
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
  //YOU WRITE THIS METHOD!
  if (levels == 0) {
    triangle(v1x, v1y, v2x, v2y, v3x, v3y);
  } else {
  //draw a triangle at the midpoints of the current triangle so basically it would look like a triangle inside a triangle
    triangle(
      midpointX(v1x, v2x), midpointY(v1y, v2y), 
      midpointX(v2x, v3x), midpointY(v2y, v3y), 
      midpointX(v3x, v1x), midpointY(v3y, v1y)); 
    //now i did that for the triangles formed by drawing a triangle inside a triangle
    //in order to do so it would be the vertex of the triangle + the other two midpoints of the triangle
    //bc the triangle drawn previously was made using the midpoints of the triangle
    //so to get the triangles formed by drawing a triangle, it has to be midpoint midpoint and vertex
    gasket(levels-1, 
      midpointX(v1x, v2x), midpointY(v1y, v2y), 
      v1x, v1y, 
      midpointX(v3x, v1x), midpointY(v3y, v1y));
    gasket(levels-1, 
      midpointX(v1x, v2x), midpointY(v1y, v2y),
      midpointX(v2x, v3x), midpointY(v2y, v3y), 
      v2x, v2y); 
    gasket(levels-1, 
      v3x, v3y, 
      midpointX(v2x, v3x), midpointY(v2y, v3y), 
      midpointX(v3x, v1x), midpointY(v3y, v1y));
  }
}

//calcucated the midpoints for x and y
float midpointX(float x1, float x2) {
  return (x1 + x2) / 2;
} 

float midpointY(float y1, float y2) {
  return (y1 + y2) / 2;
}

void draw() { 
  background(50);  

  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levles", 20, 20);

  gasket(levels, 0, height-10, width, height-10, width/2, 10);

  //koch(levels,width-10, height/2,10, height/3 ); 
  //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked() { 
  levels ++;
}

void keyPressed() {
  levels --;
}
