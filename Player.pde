public class Player{
  color playerColor; 
  int win = 0; 
  int turn = 0; 
  
  Player(color playerColor){
    this.playerColor = playerColor; 
  }
  
  public void placeGamePiece(Board[][] board){
    if (mouseX > 0 && mouseX < board[0][0].getGridX()){
      for (int r = board.length-1; r >= 0; r--){
        if (board[r][0].getColor() == 250){
          board[r][0].setColor(playerColor);
          break; 
        }
      }
    }
    
    for (int c = 0; c < board[0].length; c++){
      if (mouseX > board[0][c].getGridX() && mouseX < board[0][c+1].getGridX()){
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
