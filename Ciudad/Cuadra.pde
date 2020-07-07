class Cuadra {
  int i;
  int x;
  int y;
  int w;
  int h;
  
  int edificioAncho = 10;
  int edificioAlto = 10;

  ArrayList <Edificio> edificios = new ArrayList<Edificio>();    
  
  Cuadra(){
   
  }
  
  Cuadra(int index, int x, int y, int w, int h){
    //println("Cuadra: " + index);
    //println(posX,posY);
    this.i = index;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    //println("Cuadra: " + w*h +"m2");
    
    pushMatrix();
    translate(x,y);
    int indice = 0;    
    //Edificios por cuadra/ancho de edificio
    int totalX = this.w/edificioAncho;
    int totalY = this.h/edificioAlto;
    //println("Cuadra: totalX " + totalX);
    //println("Cuadra: totalY " + totalY);
    for(int i = 0;i<totalX;i++){
      int miX = (edificioAncho)*i;
      for(int j = 0;j<totalY;j++){
        int miY = (edificioAlto)*j;        
        Edificio miEdificio = new Edificio(indice,miX,miY);
        edificios.add(miEdificio);  
        indice++;
      }
    }
    popMatrix();    
    draw();
  }
  
  void draw(){
    pushMatrix();
    translate(x,y);

    fill(50);
    noStroke();
    rect(0,0,w,h);    
    for(int i = 0;i<edificios.size();i++){
      Edificio edificio = edificios.get(i);
      edificio.draw();
    }
    popMatrix();
  }
  
}