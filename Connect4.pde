boolean resolutionChosen = false;
boolean gridSizeChosen = false;
boolean rowsChosen = false;
boolean columnsChosen = false;
static int rows = 0;
static int columns = 0;

Board[][] board = new Board[rows][columns];
int num = 0;
String str_num = "";

Player playerOne;// = new Player(#F51111);
Player playerTwo;// = new Player(#F0F511);

void setup(){
  size(1080,720); 
  playerOne = new Player(#F51111);
  playerTwo = new Player(#F0F511);
   
  for (int i = 0; i < rows; i++){
    for(int j = 0; j < columns; j++){
      board[i][j] = new Board (((j + (1/2))*(width/columns)), ((i + (1/2))*(height/rows)));
    }
  }
}

void draw(){
  chooseGridSize(); 
  drawGrid();  
  
  if (playerOne.win != 2 && playerTwo.win != 2){
    playGame();
  }
}


void chooseGridSize(){
  //allowing user to choose grid size
  if(gridSizeChosen == false){
      background(0,0,0);
      fill(255); 
    if(rowsChosen == false){
         text("choose number of rows press enter to confirm", width/2, height/2);
         text("rows : " + rows, width / 2 , height/2+100);
     }
     else{
        if(columnsChosen == false){
          text( "choose number of columns press enter to confirm", width/2, height/2);
          text("rows : " + rows + "  columns :" + columns, width / 2 , height/2+100);
            
        }
     }
  }
}
  
void keyPressed(){
   if(gridSizeChosen == false){
    if(rowsChosen == false){
      if( key >= '0' && key <= '9' ){
        str_num += key; 
      }
      if( key == ENTER || key == RETURN ){
        num = int( str_num );
        rows = num; 
        str_num = "";
        println( num );
        rowsChosen = true;
      }

    }
    else{
      if(columnsChosen == false){
         if( key >= '0' && key <= '9' ){
          str_num += key; 
          
      }
         if( key == ENTER || key==RETURN){
           num = int(str_num);
           columns = num;
           str_num = "";
           println(num);
           columnsChosen = true;
         }
      }
    }
   }
}

void drawGrid(){
  //draws grid based on chooseGridSize()
  if (rows != 0 && columns != 0){
  background(62, 144, 255);
    //for (int j = (height/(2*rows)); j <= height; j += (height/rows)){
    //  for (int i = (width/(2*columns)); i <= width; i += (width/columns)){
    //    fill(#98A8BF); 
    //    circle (, j, (height/rows)-20); 
    //  }
    //}
  for(int r = 0; r < rows; r++) {
                for(int c = 0; c < columns; c++) {
                    fill(board[r][c].getColor());
                    circle(board[r][c].getGridX(), board[r][c].getGridY(), (height/rows)-20);
                }
            }
  }
  
  //if (rows != 0 && columns != 0){
  //  background(62, 144, 255);
  //  for (int j = (height/(2*rows)); j <= height; j += (height/rows)){
  //    for (int i = (width/(2*columns)); i <= width; i += (width/columns)){
  //      fill(#98A8BF); 
  //      circle (i, j, (height/rows)-20); 
  //    }
  //  }
  //}
}

//public void mouseClicked(){
//  if (columnsChosen == true){
//    fill (#FFFFFF); 
//    circle(3, 4, 500);
//    if (pOneTurn() == true){
//      playerOne.placeGamePiece();
//      playerOne.turn ++; 
//    }else{
//      playerTwo.placeGamePiece();
//      playerTwo.turn ++; 
//    }
//  }
//}

boolean pOneTurn(){
  return playerOne.turn == playerTwo.turn;
}

void playGame(){
  if (gridSizeChosen == true){
    if (pOneTurn() == true){
      playerOne.placeGamePiece();
      playerOne.turn ++; 
    }else{
      playerTwo.placeGamePiece();
      playerTwo.turn ++; 
    }
  }
}

void reset(){
  clear();
  resolutionChosen = false;
  gridSizeChosen = false;
  rowsChosen = false;
  columnsChosen = false;
  rows = 0;
  columns = 0;
}
