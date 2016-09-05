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
    println("Auto",x,y,direccion);
    this.x = x;
    this.y = y;
    this.direccion = direccion;
    iniciar();
  }
  
  void iniciar(){
    //println("iniciar();");
    this.w = int(random(2,4));
    this.h = int(random(4,6));    
    this.velocidad = random(1,3);  
    construir();
  }
  
  void construir(){
    //println("construir();");
    pushMatrix();
    noStroke();    
    if(direccion=="h"){   
      //Según el sentido, rotar anti horario o no
      rotate(radians(-90));
    }
    fill(100);
    rect(0,0,this.w,this.h);        
    //Gorrito Taxi
    /*
    fill(255,255,0);
    rect(this.w/2-3,this.h/2-3,6,6);   
    */
    //Luces
    fill(255,0,0);
    rect(0,0,1,1);   
    rect(this.w-1,0,1,1);   
    fill(255,255,0);
    rect(0,this.h-1,1,1);   
    rect(this.w-1,this.h-1,1,1);   
    
    popMatrix();        
  }


  void draw(){
    pushMatrix();
    translate(this.x,this.y);
    if(direccion=="v"){   
     this.y = this.y+this.velocidad;
      if(this.y>height+this.h){
        iniciar();
        this.y = 0;
      }
      if(this.y+this.h<0){
        this.y = height;
        iniciar();
      } 
    } else {
      this.x = this.x+this.velocidad;
      if(this.x>width+this.w){
        iniciar();
        this.x = 0;
      }
      if(this.x<0){
        this.x = width;
        iniciar();
      }
    }    
    construir();
    popMatrix();
  }
  
}