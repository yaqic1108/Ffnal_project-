class Board{
  private color gridColor;// = #98A8BF; 
  private float gridX; 
  private float gridY; 
  
  Board (float x, float y){
    gridColor = 250;
    gridX = x; 
    gridY = y; 
  }
  
  void setColor(color Color){
    gridColor = Color; 
  }
  
  float getGridX(){
    return gridX; 
  }
  
  float getGridY(){
    return gridY;
  }
  
  color getColor(){
    return gridColor;
  }
 
}
