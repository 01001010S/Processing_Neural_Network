class Layer {
  ArrayList<Neuron> neurons = new ArrayList<Neuron>();
  Layer(int size, Layer layerInfront) {
    for (int i = 0; i < size; i++) {
      neurons.add(0, new Neuron(layerInfront));
    }
    //println(neurons);
  }

  void display() {
    noFill();
    strokeWeight(1);
    stroke(255);
    rect(0, 0, neuronRadius*2+neuronPadding*2, (neuronPadding)*(neurons.size()*2)+neuronRadius*(neurons.size()*2));
    for (int i = 0; i < neurons.size(); i++) {
      displayNeuron(i);
    }
  }

  void feedForward() {
    for (int i = 0; i < neurons.size(); i++) {
      Neuron temp = neurons.get(i);
      temp.feedToNextLayer();
    }
  }
  
  void calcValues() {
    for (int i = 0; i < neurons.size(); i++) {
      Neuron temp = neurons.get(i);
      temp.calcValue();
    }
  }
  
  void reset() {
    for (int i = 0; i < neurons.size(); i++) {
      neurons.get(i).reset();
    }
  }

  void setValues(FloatList input) {
    for (int i = 0; i < neurons.size(); i++) {
      neurons.get(i).setValue(input.get(i));
    }
  }

  FloatList getValues(){
    //println("neuron num:"+neurons.size());
    FloatList temp = new FloatList();
    //temp.
    for (int i = 0; i < neurons.size(); i++) {
      //println("neuron get value: " + neurons.get(i).getValue());
      //println("temp: "+temp);
      temp.append(neurons.get(i).getValue());
    }
    return temp;
  }

  void displayNeuron(int i) {
    pushMatrix();
    translate(neuronPadding+neuronRadius, (neuronPadding+neuronRadius)*(2*i+1));
    neurons.get(i).display(i);
    popMatrix();
  }
}
