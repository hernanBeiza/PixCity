int ancho = 30;
int alto = 30;
int separador = 10;

void setup(){
  size(590,590);
  int totalX = 600/(ancho);
  println(totalX);
  int totalY = 600/(alto);
  println(totalY);
  background(0);  
  for(int i =0;i<totalX;i++){
    int posX = (ancho+separador)*i;
    for(int j =0;j<totalY;j++){
      int posY=(alto+separador)*j;
      rect(posX,posY,ancho,alto);
      //println(posX,posY);
    }
  }
  saveFrame("frames/####.tif");
}

/*
void draw(){
  
}
*/