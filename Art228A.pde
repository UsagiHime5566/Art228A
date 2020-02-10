import processing.video.*;

Movie movieLoop;
Movie movieMain;

int stats;

void setup() {
  //size(1920, 1080);
  
  fullScreen();
  background(0);
  
  movieLoop = new Movie(this, "aaa_90.mp4");
  movieMain = new Movie(this, "bbb_90.mp4") {
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
  if(stats == 0 && movieLoop.width == 1920)
    //image(movieLoop, 0, 0, width, height);
    background(movieLoop);
  if(stats == 1 && movieMain.width == 1920)
    //image(movieMain, 0, 0, width, height);
    background(movieMain);
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