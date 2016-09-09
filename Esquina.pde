
class Esquina {
  
  int index;
  int x;
  int y;
  boolean estado;
  
  final int WAIT_TIME = (int) (5 * 1000); // 5 seconds
  int startTime = 0;
  
  Esquina(){
    
  }
  
  Esquina(int index, int posX, int posY, boolean estado){
    this.index = index;
    this.x = posX;
    this.y = posY;
    this.estado = estado;
  }
  
  void draw(){
    pushMatrix();
    translate(this.x,this.y);    
    color miColor = color(255,0,0);
    if(estado){
      miColor = color(0,255,0);
    } else {
      miColor = color(255,0,0);
    }
    fill(miColor);
    rect(0,0,10,10);
    //text(this.index,20,10);
    popMatrix();   
    controlSemaforo();
  }
  
  void controlSemaforo(){
    if(hasFinished()){
        //println(this.index,WAIT_TIME/1e3 + " seconds have transpired!");
        startTime = millis();       
        if(estado){
          estado = false;          
        } else {
          estado = true;
        }
    }
  }
  
  boolean hasFinished() {
    return millis() - startTime > WAIT_TIME;
  }
  
}