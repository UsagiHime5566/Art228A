import processing.video.*;

Movie movieLoop;
Movie movieMain;

int stats;

void setup() {
  //size(1920, 1080);
  fullScreen();
  background(0);
  
  movieLoop = new Movie(this, "aaa.mp4");
  movieMain = new Movie(this, "bbb.mp4") {
    @ Override public void eosEvent() {
      super.eosEvent();
      myEoS();
    }
  };
  
  movieLoop.loop();
  stats = 0;
}

void myEoS(){
  stats = 0;
  movieMain.jump(0);
  movieMain.stop();
}

void draw() {
  translate(0, height);  
  rotate(-PI/2);  
  
  if(stats == 0)
    image(movieLoop, 0, 0, height, width);
  if(stats == 1)
    image(movieMain, 0, 0, height, width);
}

void movieEvent(Movie m) {
  if(stats == 0 && m == movieLoop)
    m.read();
  if(stats == 1 && m == movieMain)
    m.read();
}

void mousePressed() {
  stats = 1;
  movieMain.play();
}