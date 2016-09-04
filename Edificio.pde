class Edificio {
  int i;
  int x;
  int y;
  int w;
  int h;

  Edificio() {
  }

  Edificio(int i, int x, int y, int w, int h) {
    //println("Edificio: " + i);
    this.i = i;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    construir();
  }

  Edificio(int i, int x, int y) {
    //println("Edificio: " + i);
    this.i = i;
    this.x = x;
    this.y = y; 
    this.w = int(random(5, 10));
    this.h = int(random(5, 10));
    construir();
  }

  public void construir() {
    pushMatrix();
    println("Edificio: " + this.w*this.h+ "m2");
    translate(this.x, this.y);
    //stroke(255);
    fill(0);
    rect(0, 0, this.w, this.h);   
    //Azotea
    /*
    fill(9);
    int ancho = this.w/4;
    int alto = this.h/4;
    rect(this.w/2-ancho/2, this.h/2-alto/2, ancho, alto);       
    */
    popMatrix();
  }

  public String toString() {
    return this.x+","+this.y+","+this.w+","+this.h;
  }
}