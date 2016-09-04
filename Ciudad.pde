String version = "0.0.3";

int cuadraAncho = 50;
int cuadraAlto = 50;
int edificioAncho = 5;
int edificioAlto = 5;

int cuadraSeparador = 10;
int edificioSeparador = 5;

void setup(){
  println("Ciudad " + version);
  size(590,590);
  int totalX = 600/(cuadraAncho);
  int totalY = 600/(cuadraAlto);
  println(totalX,totalY);
  pushMatrix();
  background(0);  
  int indice = 0;
  for(int i =0;i<totalX;i++){
    int posX = (cuadraAncho+cuadraSeparador)*i;
    for(int j =0;j<totalY;j++){
      int posY=(cuadraAlto+cuadraSeparador)*j;
      Cuadra miCuadra = new Cuadra(indice,posX,posY,cuadraAncho,cuadraAlto);
      indice++;
    }
    indice++;
  }
  popMatrix();
  saveFrame("frames/"+version+".tif");
}