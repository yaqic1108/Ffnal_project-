public class Player{
  color playerColor; 
  int win = 0; 
  int turn = 0; 
  
  double columnSize = (double) (width/Connect4.columns);
  double rowSize = (double) (height/Connect4.rows); 
  
  public void Player(color playerColor){
    this.playerColor = playerColor; 
  }
  
  public void placeGamePiece(){
    //doesnt work...only for set grid 
    //if (0 < mouseX && mouseX < columnSize){
    //  fill(#98A8BF); 
    //  circle ((float)(columnSize/2), (float)rowSize, (float)(height/Connect4.rows)-20); 
    //}else if (2 * columnSize < mouseX && mouseX < columnSize * 3){
    //  fill(#98A8BF); 
    //  circle ((float)((columnSize/2)3), (float)rowSize, (float)(height/Connect4.rows)-20); 
    //}else if (3 * columnSize < mouseX && mouseX < columnSize * 4)
    int column = 0; 
    for (double i = 0; i < (width - columnSize); i += columnSize){
      for (double j = columnSize; i < width; i += columnSize){
        if (i < mouseX && mouseX < j){
          column = (int)(j/rowSize);
          for (int z = 0; z < Connect4.board.length; z++){
            if (Connect4.board[z][column] == 0){
              fill(playerColor); 
              circle ((float)column, (float)z, (float)(height/Connect4.rows)-20);
              Connect4.board[z][column] = 1; 
            }
          }
        }
      }
    }
  }
}
