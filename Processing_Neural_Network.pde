float neuronRadius = 10;
float neuronPadding = 10;
float layerSpacing = 125;
float connectionStrokeWeight = 3;
IntList dimensions = new IntList(2,3,2);
Brain test = new Brain(dimensions);

void setup() {
  size(600, 600);
  //smooth(0);
}


void draw(){
  background(0);
  fill(255);
  text(frameRate,10,20);
  FloatList mousePos = new FloatList(((float)mouseX)/((float)width),((float)mouseY)/((float)height));
  //println("x: "+((float)mouseX)/((float)width)+" y: "+((float)mouseY)/((float)height));
  //println(mousePos);
  test.evaluate(mousePos,true, 0,0);
}
