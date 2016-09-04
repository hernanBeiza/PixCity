class Cuadra{
  int i;
  int x;
  int y;
  int w;
  int h;
  ArrayList <Edificio> edificios = new ArrayList<Edificio>();    
  
  Cuadra(){
   
  }
  
  Cuadra(int index, int x, int y, int w, int h){
    println("Cuadra: " + index);
    //println(posX,posY);
    pushMatrix();
    translate(x,y);
    this.i = index;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    fill(50);
    noStroke();
    rect(0,0,w,h);
    
    int indice = 0;    
    //Edificios por cuadra/ ancho de edificio
    int totalX = w/10;
    println("Cuadra: totalX " + totalX);
    int totalY = h/10;
    println("Cuadra: totalY " + totalY);
    
    for(int i = 0;i<totalX;i++){
      int miX = (edificioAncho+edificioSeparador)*i;
      for(int j = 0;j<totalY;j++){
        int miY = (edificioAlto+edificioSeparador)*j;        
        Edificio miEdificio = new Edificio(indice,miX,miY);
        edificios.add(miEdificio);          
      }
        indice++;
    }
    popMatrix();    
  }
  
  
}