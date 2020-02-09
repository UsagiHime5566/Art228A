import processing.video.*;

Movie movieLoop;
Movie movieMain;

int stats;

void setup() {
  size(450, 800);
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
  if(stats == 0)
    image(movieLoop, 0, 0, width, height);
  if(stats == 1)
    image(movieMain, 0, 0, width, height);
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