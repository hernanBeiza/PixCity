class Edificio{
  int i;
  int x;
  int y;
  int w;
  int h;
 
  Edificio(){
    
  }
  
  Edificio(int i, int x, int y,int w, int h){
    println("Edificio: " + i);
    this.i = i;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    construir();
   }
  
  Edificio(int i, int x, int y){
    println("Edificio: " + i);
    this.i = i;
    this.x = x;
    this.y = y; 
    this.w = int(random(5,10));
    this.h = int(random(5,10));
    construir();    
  }
  
  public void construir(){
    pushMatrix();
    translate(this.x+this.w/2,this.y+this.h/2);
    //stroke(255);
    fill(0);
    rect(0,0,this.w,this.h);   
    popMatrix();    
  }
  
  public String toString(){
    return this.x+","+this.y+","+this.w+","+this.h; 
  }
}