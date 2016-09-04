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
    pushMatrix();
    translate(x+this.w/2,y+this.h/2);
    //stroke(255);
    fill(0);
    rect(0,0,w,h);   
    popMatrix();
  }
  
}