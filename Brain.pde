class Brain {
  ArrayList<Layer> layers = new ArrayList<Layer>();

  Brain(IntList layerSizes) {
    for (int i = layerSizes.size()-1; i >= 0; i--) {
      Layer layerInfront;
      if (layers.size() == 0) {
        layerInfront = null;
      } else {
        layerInfront = layers.get(0);
      }
      layers.add(0, new Layer(layerSizes.get(i), layerInfront));
    }
    //println(layers);
  }

  void display(float x, float y) {
    pushMatrix();
    translate(x, y);
    for (int i = 0; i < layers.size(); i++) {
      displayLayer(i);
    }
    popMatrix();
  }

  void displayLayer(int i) {
    pushMatrix();
    translate((layerSpacing+neuronRadius*2+neuronPadding*2)*i, 0);
    layers.get(i).display();
    popMatrix();
  }

  void feedForward() {
    layers.get(0).feedForward();
    for (int i = 1; i < layers.size(); i++) {
      layers.get(i).calcValues();
      layers.get(i).feedForward();
    }
  }

  void setInput(FloatList input) {
    //println(input);
    layers.get(0).setValues(input);
  }
  
  FloatList getOutput() {
    return layers.get(layers.size()-1).getValues();
  }
  
  
  FloatList evaluate(FloatList input, Boolean display, float x, float y){
    setInput(input);
    feedForward();
    if(display){
      display(x, y);
    }
    FloatList output = getOutput();
    reset();
    return output;
  }

  void reset() {
    for (int i = 0; i < layers.size(); i++) {
      layers.get(i).reset();
    }
  }
}
