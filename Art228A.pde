import processing.video.*;

Movie myMovie;



void setup() {
  size(450, 800);
  myMovie = new Movie(this, "film.mp4") {
    @ Override public void eosEvent() {
      super.eosEvent();
      myEoS();
    }
  };
  myMovie.play();
  print("begin- ");
}

void myEoS(){
  print("end");
}

void draw() {
  image(myMovie, 0, 0, width, height);
}

void movieEvent(Movie m) {
  if (m == myMovie) {
    myMovie.read();
  } //else if (m == yourMovie) {
    //yourMovie.read();
  //}
}

void mousePressed() {
  myMovie.stop();
}
