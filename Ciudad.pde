String version = "0.0.5";

int cuadraAncho = 50;
int cuadraAlto = 50;

int cuadraSeparador = 10;//calle finalmente

ArrayList <Calle> calles = new ArrayList();
ArrayList <Cuadra> cuadras = new ArrayList();

void setup(){
  println("Ciudad " + version);
  size(610,610);
  
  int totalX = 600/(cuadraAncho);
  int totalY = 600/(cuadraAlto);
  println(totalX,totalY);
  background(0);  
  
  //Calles
  for(int i =0;i<totalX;i++){
    int posX = (cuadraAncho+cuadraSeparador)*i;
    int posY = (cuadraAlto+cuadraSeparador)*i;
    Calle miCalle = new Calle(i,posX,0,10,height,"v");
    Calle miCalle2 = new Calle(i,0,posY,width,10,"h");
    calles.add(miCalle);
    calles.add(miCalle2);
  }
  //Cuadras
  translate(cuadraSeparador,cuadraSeparador);
  int indice = 0;
  for(int i =0;i<totalX;i++){
    int posX = (cuadraAncho+cuadraSeparador)*i;
    for(int j =0;j<totalY;j++){
      int posY=(cuadraAlto+cuadraSeparador)*j;
      Cuadra miCuadra = new Cuadra(indice,posX,posY,cuadraAncho,cuadraAlto);
      cuadras.add(miCuadra);
      indice++;
    }
    indice++;
  }  
  
}

void draw(){
  background(255);  
  for(int i =0;i<calles.size();i++){
    Calle calle = calles.get(i);
    calle.draw();
  }
  translate(cuadraSeparador,cuadraSeparador);  
  for(int i =0;i<cuadras.size();i++){
    Cuadra cuadra = cuadras.get(i);
    cuadra.draw();
  }
  saveFrame("frames/"+version+"/"+version+"####.tif");  
}