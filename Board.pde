class Board{
  private color gridColor = #98A8BF; 
  private int gridX; 
  private int gridY; 
  
  Board (int x, int y){
    gridX = x; 
    gridY = y; 
  }
  
  void setColor(int Color){
    gridColor = Color; 
  }
  
  int getGridX(){
    return gridX; 
  }
  
  int getGridY(){
    return gridY;
  }
  
  int getColor(){
    return gridColor;
  }
 
}
