
class Calle{
  int index;
  int x;
  int y;
  int w;
  int h;
  String direccion;
  
  ArrayList <Auto> autos = new ArrayList();
  ArrayList <Auto> autos2 = new ArrayList();
  
  ArrayList <Esquina> esquinas = new ArrayList();

  Calle(){
    
  }
  
  Calle (int index,int x,int y,int w,int h,String direccion){
    //println("Calle: " + index);
    this.index = index;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h; 
    this.direccion = direccion;
    
    //Sentido 1
    for(int i =0;i<10;i++){   
      Auto miAuto = new Auto(i,this,0,100*i,this.direccion,1);   
      autos.add(miAuto);
    }
    //Sentido 2
    for(int i =0;i<10;i++){   
      Auto miAuto2 = new Auto(i,this,0,100*i,this.direccion,2);   
      autos2.add(miAuto2);
    }

    //Esquinas
    for(int i =0;i<11;i++){
      int posX = 0;
      int posY = (cuadraAlto+10)*i;    
      boolean estado = true;
      if(int(random(1,3))==1){
        estado = true;
      } else {
        estado = false;
      }
      
      Esquina esquina = new Esquina(i,posX,posY,estado);
      esquinas.add(esquina);    
    }
  }
  
  void draw(){
    pushMatrix();
    translate(this.x,this.y);    
    if(this.direccion=="h"){
      rotate(radians(-90));
    }
    //debug
    //stroke(255,255,0);
    //fill(0);
    noStroke();
    //stroke(255,255,0);
    noFill();
    rect(0,0,this.w,this.h);
    //Esquinas
    for(int i=0;i<esquinas.size();i++){
      Esquina esquina = esquinas.get(i);
      esquina.draw();
    }
    //Autos
    for(int i=0;i<autos.size();i++){
      Auto auto = autos.get(i);
      auto.index = i;
      auto.draw();
    }   
    for(int i=0;i<autos2.size();i++){
      Auto auto = autos2.get(i);
      auto.index = i;
      auto.draw();
    }
    popMatrix();
  }
  
  void remove(Auto auto){
    if(auto.sentido==1){
      autos.remove(auto.index);
      autos.add(auto);
    } else if(auto.sentido==2){
      autos2.remove(auto.index);
      autos2.add(auto);
    }
  }
  
}