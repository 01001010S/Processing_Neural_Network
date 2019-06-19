class Neuron {
  Layer frontLayer;
  ArrayList<Float> connections = new ArrayList<Float>();
  Float _value;
  ArrayList<Float> _inputs = new ArrayList<Float>();
  
  Neuron(Layer layerInFront) {
    frontLayer = layerInFront;
    if (frontLayer != null) {
      for (int i = 0; i < frontLayer.neurons.size(); i++) {
        connections.add(0, random(-1, 1));
      }
    }
  }
  
  void display(int position) {
    stroke(255);
    strokeWeight(1);
    if(getValue() == null){
      noFill();
      noStroke();
    }else if(getValue() > 0){
      fill(255,0,0,abs(getValue())*255);
    }else{
      fill(0,0,255,abs(getValue())*255);
    }
    ellipse(0, 0, neuronRadius*2, neuronRadius*2);
    for(int i = 0; i < connections.size(); i++){
      displayConnection(i, position);
    }
  }

  void displayConnection(int i, int position) {
    noFill();
    strokeWeight(abs(connections.get(i)*3));
    if(connections.get(i) > 0){
     stroke(255,0,0); 
    }else if(connections.get(i) < 0){
     stroke(0,0,255); 
    }else{
      stroke(255); 
    }
    line(0,0,neuronRadius*2+neuronPadding*2+layerSpacing,(i-position-0)*(neuronRadius*2+neuronPadding*2));
  }
  
  void takeInput(float input){
     _inputs.add(0,input);
  }
  
  float calcValue(){
    float sum = 0;
     for (int i = 0; i < _inputs.size(); i++) {
        sum += _inputs.get(i);
      }
       //println("calulating(");
    setValue(tanh(sum));
    //println(_value);
     //println(")");
    return _value;
  } 
  
  void feedToNextLayer(){
    for (int i = 0; i < connections.size(); i++) {
       frontLayer.neurons.get(i).takeInput(_value*connections.get(i));
    }
  }
  void setValue(Float val){
    //println("value set: "+val);
   _value = val; 
  }
  Float getValue(){
    //println("get value neuron side: " + _value);
   return _value;
  }
  
  void reset(){
    //println("reseting(");
    setValue(null);
    //println(")");
    _inputs.clear();
  }
  
  
//------ ACTIVATION FUNCTIONS -------
   float sigmoid(float x) {
    return (float)(1/( 1 + Math.pow(Math.E,(-1*x))));
  }
  
  float tanh(float x) {
    return  2 * sigmoid(2*x) - 1 ;
  }
}
