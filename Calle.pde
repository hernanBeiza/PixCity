class Calle{
  int index;
  int x;
  int y;
  int w;
  int h; 
  
  Calle(){
    
    
    
  }
  
  Calle (int index,int x,int y,int w,int h){
    println("Calle: " + index);
    this.index = index;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;    
    draw();  
  }
  
  void draw(){
    pushMatrix();
    translate(this.x,this.y);
    fill(0);
    rect(0,0,this.w,this.h);
    
    
    popMatrix();
    
    
    
  }
  
}