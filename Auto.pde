class Auto {
  
  float x;
  float y;
  int w;
  int h;
  float velocidad;
  String direccion;
  
  Auto(){
    
    
  }
  
  Auto(float x, float y, String direccion){
    this.x = x;
    this.y = y;
    this.w = int(random(5,7));
    this.h = int(random(7,10));    
    this.direccion = direccion;
    this.velocidad = random(1,3);       
  }
  
  void draw(){
    pushMatrix();
    fill(100);

    if(direccion=="v"){
      this.y = this.y+this.velocidad;
      translate(0,y);
      if(this.y>height){
        this.y = 0;
      }
      if(this.y<0){
        this.y = height;
      }
    } else {
      this.x = this.x+this.velocidad;
      translate(x,0);
      if(this.x>width){
        this.x = 0;
      }
      if(this.x<0){
        this.x = width;
      }
    }
    rect(0,0,this.w,this.h);
    
    popMatrix();
    
  }
  
}