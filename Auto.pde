class Auto {
  int index;
  float x;
  float y;
  int w;
  int h;
  float velocidad;
  float velocidadMax;
  String direccion;
  int sentido;
  Calle calle;
  
  Auto(){    
    
  }
  
  Auto(int index,Calle calle,float x, float y, String direccion, int sentido){
    //println("Auto: ",index,x,y,direccion);
    this.index = index;
    this.calle = calle;
    this.x = x;
    this.y = y;
    this.direccion = direccion;
    this.sentido = sentido;
    iniciar();
  }
  
  void iniciar(){
    //println("iniciar();");
    this.w = int(random(2,4));
    this.h = int(random(4,6));    
    this.velocidad = 0;//random(1,5);  
    this.velocidadMax = random(1,10);//random(1,5);      
    //this.sentido = int(random(1,3));
    if(sentido==2){
      this.x = calle.w;
      rotate(radians(180));    
    } 
    
    construir();
  }
  
  void construir(){
    //println("construir();");
    pushMatrix();
    noStroke();        
    fill(100);
    rect(0,0,this.w,this.h);        
    //Gorrito
    //fill(255,255,0);
    //rect(this.w/2-3,this.h/2-3,6,6);   
    //Luces
    fill(255,0,0);
    rect(0,0,2,2);   
    rect(this.w-2,0,2,2);   
    fill(255,255,0);
    rect(0,this.h-2,2,2);   
    rect(this.w-2,this.h-2,2,2);       
    popMatrix();        
  }
  
  void draw(){
    pushMatrix();
    translate(this.x,this.y);
    if(this.sentido==2){
      rotate(radians(180));    
    }

    //Revisar posibles choques con otros wns 
   if(this.index==0){
      //println("Soy el primero: this.index:" + this.index);
      this.velocidad+=0.1;
    } else {      
      Auto anterior;
      if(sentido==1){
        anterior = (Auto)calle.autos.get(this.index-1); 
      } else {
        anterior = (Auto)calle.autos2.get(this.index-1);              
      }
      //Choques
      float d = dist(this.x, this.y, anterior.x,anterior.y);
      //println("this.index: " + this.index + " anterior.index: " + anterior.index + " d: "+ d);
      if(d<50){
          //println("frenaR");
          //println(toString());          
          //float nuevaVelocidad = map(this.velocidad,1,10,0,otro.velocidad);
          //this.velocidad = nuevaVelocidad;        
          float easing = 0.2;
          float targetX = anterior.velocidad;
          float dx = targetX - this.velocidad;
          this.velocidad += dx * easing;              
      } else {
        this.velocidad+=0.1;  
      }
    }

    //Límites Velocidad
    if(this.velocidad>=velocidadMax){
      this.velocidad = velocidadMax;      
    }
    if(this.velocidad<0){
      this.velocidad = 0;
    }   
    
    //Bounds
    if(this.sentido==1){
      this.y += this.velocidad;        
    } else {
      this.y -= this.velocidad;
    }
    println(velocidad);
    if(this.y>height+this.h){
      reset();
      this.y = -200;
      iniciar();
    }
    if(this.y+this.h<-200){
      reset();
      this.y = height;
      iniciar();
    }
    construir();       
    popMatrix();
  }
  
  void reset(){
    calle.remove(this);
  }
  
  String toString(){
    return "index: " + this.index +  " x: " + this.x +" y: " + this.y +" velocidad: " + this.velocidad;
  }
  
}