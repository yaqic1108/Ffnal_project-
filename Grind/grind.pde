
void setup(){
  size(700, 500); 
  background(62, 144, 255); 
  draw(); 
}

void draw(){
  drawGrid(); 
}

void drawGrid(){
  for (int j = 50; j <= 450; j += 100){
    for (int i = 50; i <= 650; i += 100){
      fill(#98A8BF); 
      circle (i, j, 70); 
    }
  }
}

//void drawGamePiece(){
//  if (player == 0){
    
//}

//void 
