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
    
    if(revisarChoques()){
      float easing = 0.2;
      float targetX = obtenerAnterior().velocidad;
      float dx = targetX - this.velocidad;
      frenar(dx,easing);
    } else if(revisarDetenerEnEsquina()){
      
      float easing = 0.2;
      float targetX = obtenerEsquina().x;
      float dx = targetX - this.velocidad;
      frenar(dx,easing);
      
    } else {
      avanzar();
    }
    
    revisarLimites();
    construir();       
    popMatrix();
  }
  
  boolean revisarDetenerEnEsquina(){    
    Esquina esquina = obtenerEsquina();
    if(esquina!=null){
      
      if(esquina.estado){
        return false;        
      } else {
        return true;
      }
    } else {
      return false;
    }
  }
    
  Esquina obtenerEsquina(){
    Esquina esquina = null;
    for(int i=0;i<calle.esquinas.size();i++){
      esquina = (Esquina)calle.esquinas.get(i);
      float d = dist(this.x, this.y, esquina.x,esquina.y);
      if(d<50){
        return esquina;
      }
    }
    return null;
  }

  //Choques con otros autos y la esquina
  boolean revisarChoques(){
    float d = dist(this.x, this.y, obtenerAnterior().x,obtenerAnterior().y);
    //Puede ser aleatoria. Una suerte de "reacción" del conductor
    if(d<50){
      return true;
    } else{
      return false;
    }
  }   
  
  Auto obtenerAnterior(){
    Auto anterior;
    if(this.index==0){
      anterior = (Auto)calle.autos.get(calle.autos.size()-1); 
    } else {    
      if(sentido==1){
        anterior = (Auto)calle.autos.get(this.index-1); 
      } else {
        anterior = (Auto)calle.autos2.get(this.index-1);              
      }      
    }
    return anterior;
  }
  
  void avanzar(){
    //Límites Velocidad
    this.velocidad+=1;
    if(this.velocidad>=velocidadMax){
      this.velocidad = velocidadMax;      
    }
    if(this.velocidad<0){
      this.velocidad = 0;
    }   
  }
  
  void frenar(float dx, float easing){
    this.velocidad += dx * easing;              
  }
  
  void revisarLimites(){
    //Bounds
    if(this.sentido==1){
      this.y += this.velocidad;        
    } else {
      this.y -= this.velocidad;
    }
    //println(velocidad);
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
  }
  
  void reset(){
    calle.remove(this);    
  }
  
  String toString(){
    return "index: " + this.index +  " x: " + this.x +" y: " + this.y +" velocidad: " + this.velocidad;
  }
  
}