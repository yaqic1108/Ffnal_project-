public class Player{
  color playerColor; 
  int win = 0; 
  int turn = 0; 
  int rows= 0;
  int columns = 0;
  
  Player(color playerColor, int rows, int columns){
    this.playerColor = playerColor; 
    this.rows = rows;
    this.columns = columns;
  }
  
  public void addTurn(){
    turn++;
  }
  public color getColor(){
    return playerColor;
  }
  
  public void placeGamePiece(Board[][] board){
    //if (mouseX > 0 && mouseX < board[0][0].getGridX()){
    //  for (int r = board.length-1; r >= 0; r--){
    //    if (board[r][0].getColor() == 250){
    //      board[r][0].setColor(playerColor);
    //      break; 
    //    }
    //  }
    //}
     for(int c =0; c <= board[0].length-1; c++){
      if((c==rows-1 &&mouseX>board[0][c].getGridX()- width/rows/2&& mouseX<width)){
        for (int r = board.length-1; r >= 0; r--){
          if (board[r][c].getColor() == 250){
            board[r][c].setColor(playerColor);
            break; 
          }
        }
        break;
        
      
      }}
    for (int c = 0; c < board[0].length-1; c++){
      if ((mouseX > board[0][c].getGridX() - width/rows/2 && mouseX < board[0][c+1].getGridX()- width/rows/2)){
       
        for (int r = board.length-1; r >= 0; r--){
          if (board[r][c].getColor() == 250){
            board[r][c].setColor(playerColor);
            break; 
          }
        }
        break;
      }

    }
  }
}
