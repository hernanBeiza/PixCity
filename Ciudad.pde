String version = "0.0.4";

int cuadraAncho = 50;
int cuadraAlto = 50;

int cuadraSeparador = 10;//calle finalmente

void setup(){
  println("Ciudad " + version);
  size(610,610);
  int totalX = 600/(cuadraAncho);
  int totalY = 600/(cuadraAlto);
  println(totalX,totalY);
  background(110);  
  
  //Calles
  for(int i =0;i<totalX;i++){
    int posX = (cuadraAncho+cuadraSeparador)*i;
    int posY = (cuadraAlto+cuadraSeparador)*i;
    Calle miCalle = new Calle(i,posX,0,10,height);
    Calle miCalle2 = new Calle(i,0,posY,width,10);
  }
  //Cuadras
  translate(cuadraSeparador,cuadraSeparador);
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
  
  saveFrame("frames/"+version+".tif");
}