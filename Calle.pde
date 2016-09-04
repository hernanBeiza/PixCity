class Calle{
  int index;
  int x;
  int y;
  int w;
  int h;
  String direccion;
  ArrayList <Auto> autos = new ArrayList();
  
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
    poblar();
    draw();  
  }
  
  void poblar(){
   for(int i =0;i<10;i++){     
     Auto auto = new Auto(0,0,this.direccion);
     autos.add(auto);
     auto.draw();
   }    
  }
  
  void draw(){
    pushMatrix();
    translate(this.x,this.y);
    //Debug
    if(this.direccion=="v"){
      fill(3);
    } else {
      fill(0);    
    }
    rect(0,0,this.w,this.h);    
    for(int i=0;i<autos.size();i++){
      Auto auto = autos.get(i);
      auto.draw();
    }
    popMatrix();
  }
  
}