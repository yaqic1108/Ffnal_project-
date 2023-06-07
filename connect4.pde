boolean resolutionChosen = false;
boolean gridSizeChosen = false;
boolean rowsChosen = false;
boolean columnsChosen = false;
boolean winnerChosen = false;

static int rows = 0;
static int columns = 0;
static int rowSize;
static int columnSize;

//private Board[][] board = new Board[rows][columns];
int num = 0;
String str_num = "";

private Board[][] board;
private Player playerOne;// = new Player(#F51111);
private Player playerTwo;// = new Player(#F0F511);

void setup(){
  size(1080,720); 
  

}

void draw(){
  if (!gridSizeChosen){
    chooseGridSize(); 
  }
  else if(gridSizeChosen){
  if (rows != 0 && columns != 0){
    if(rows <= 20 && columns <=20 && rows >=4 && columns >=4){
      rowSize = height/rows; 
  columnSize = width/columns; 
    drawGrid();  
  }
    else{
      background(0,0,0);
      text("invalid size please reset with space", width/2, height/2);
    
    }
  }
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
   if(key==' '){
     reset();
   
   }
   if(gridSizeChosen == false){
    if(rowsChosen == false){
      if( key >= '0' && key <= '9' ){
        str_num += key; 
      }
      if( key == ENTER || key == RETURN ){
        num = int( str_num );
        rows = num; 
        str_num = "";
        println("rows "+ num );
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
           println("columns " + num);
           columnsChosen = true;
           initializeBoard();
           gridSizeChosen = true;  
           playerOne = new Player(color(255,255,51),rows,columns);
            playerTwo = new Player(color(255,0,43),rows,columns);
         }
      }
    }
   }
}

void initializeBoard(){
  board = new Board[rows][columns];
  
  for (int r = 0; r < rows; r++){
    for(int c = 0; c < columns; c++){
      board[r][c] = new Board ((float)((c+0.5)*(width/columns)), (float)((r+0.5)*(height/rows)));
    }
  }
}

void drawGrid(){
  //draws grid based on chooseGridSize()
  background(62, 144, 255);
  for(int r = 0; r < rows; r++) {
      for(int c = 0; c < columns; c++) {
          
          fill(board[r][c].getColor());
          
          if (rows > columns || rows == columns){
            circle(board[r][c].getGridX(), board[r][c].getGridY(), (height/rows)-20);
          }else if (rows < columns) {
            circle(board[r][c].getGridX(), board[r][c].getGridY(), (width/columns)-20);
          }
      }
  }
}

boolean pOneTurn(){
  if (playerOne.turn == 0 && playerTwo.turn == 0){
    return true; 
  }else{
    return playerOne.turn == playerTwo.turn;
  }
}

void mousePressed(){
  
  
  if (gridSizeChosen == true){
    
    if (pOneTurn() == true){
      playerOne.placeGamePiece(board);
      //drawGrid();
      playerOne.addTurn(); 
    }else{
      
      playerTwo.placeGamePiece(board);
      //drawGrid();
      playerTwo.addTurn();
    }
    
    checkWinner();
  }
}
Player whoIsTheWinner(color c){
  if(c == playerOne.getColor()){
    print("yellowWins");
    playerOne.addWin();
    return playerOne;
  }
  if(c == playerTwo.getColor()){
    print("redWins");
    playerTwo.addWin();
    return playerTwo;
  }
  return null;
}
boolean checkWinner(){
    //check rows 
    for(int x = 0; x < rows; x++){
      int counter = 0;
      color curColor = 0;
       
      for(int  y =0 ; y < columns; y++){
        if(counter == 0){
          curColor = board[x][y].getColor();
        }  
        if( board[x][y].getColor()!=250&&board[x][y].getColor() == curColor){
          counter ++;
          if(counter == 4){
           whoIsTheWinner(curColor);
     
            return true;
          }
        }
        else if(board[x][y].getColor()!=250&&board[x][y].getColor()!=curColor){
          counter = 0;
          curColor = 0;
        
        }
        
      }    
    }
 //check columns   
    for(int y = 0; y < columns; y++){
      int counter = 0;
      color curColor = 0;
       
      for(int  x =0 ; x < rows; x++){
        if(counter == 0){
          curColor = board[x][y].getColor();
        }  
        if( board[x][y].getColor()!=250&&board[x][y].getColor() == curColor){
          counter ++;
          if(counter == 4){
            whoIsTheWinner(curColor);
         
            return true;
          }
        }
        else if(board[x][y].getColor()!=250&&board[x][y].getColor()!=curColor){
          counter = 0;
          curColor = 0;
        
        }
        
      }    
    }
// check diagonal
for(int x = 0; x < rows; x++){
   int counter = 0;
   color curColor = 0;
    int diag = 0;
  for(int y = 0; y < columns; y++){
     if(counter == 0){
       curColor = board[diag][y].getColor();
     } 
     if(board[diag][y].getColor()!=250&&board[diag][y].getColor() == curColor){
       counter++;
       if(counter==4){
         whoIsTheWinner(curColor);
         return true;
       }
     }
     else if(board[diag][y].getColor()!=250&&board[diag][y].getColor()!=curColor){
       counter = 0;
       curColor = 0;
     }
      diag++;
    }
  
  }
  return false;
}

 
    


void reset(){
  

  gridSizeChosen = false;
  rowsChosen = false;
  columnsChosen = false;
  winnerChosen = false;
  rows = 0;
  columns = 0;
}
