boolean resolutionChosen = false;
boolean gridSizeChosen = false;
boolean rowsChosen = false;
boolean columnsChosen = false;
boolean winnerChosen = false;
boolean playerAssigned = false;
String winnerString = "";
int presses = 0;
int totalParts;

static int rows = 0;
static int columns = 0;
static int rowSize;
static int columnSize;

int num = 0;
String str_num = "";

private Board[][] board;
private Player playerOne;
private Player playerTwo;
private Player tie; 

void setup(){
  size(1080,720); 
}

void draw(){
  if (!gridSizeChosen){
    chooseGridSize(); 
  }
  else if(gridSizeChosen){
    if (rows != 0 && columns != 0){
      if(rows <= 20 && columns <=20){
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
  if (winnerChosen){
    drawWinsScreen(); 
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
           initializeBoard();
           gridSizeChosen = true;  
         if(playerAssigned == false){
            playerOne = new Player(color(255,255,51),rows,columns);
            playerTwo = new Player(color(255,0,43),rows,columns);
            tie = new Player(color(250), 0,0);
            playerAssigned = true;
           }
           if(playerAssigned == true){
             playerOne.changeDim(rows, columns);
             playerTwo.changeDim(rows,columns);
           }
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
          
          if (rows > columns || rows == columns || rows == columns - 1){
            circle(board[r][c].getGridX(), board[r][c].getGridY(), (height/rows)-20);
          }else if (rows < columns) {
            circle(board[r][c].getGridX(), board[r][c].getGridY(), (width/columns)-20);
          }
      }
  }
}

void drawWinsScreen(){
  background(255,255,255);
  fill(0);
  text(winnerString, width/2, height/2);
  text("yellow wins : " +  playerOne.getWins(),width/2 ,height/2 + 100);
  text("red wins : " + playerTwo.getWins(), width/2, height/2 + 200);
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
      playerOne.addTurn(); 
    }else{
      
      playerTwo.placeGamePiece(board);
      playerTwo.addTurn();
    }
    
    boolean c = checkWinner();
    if (c==true){
      winnerChosen = true;
    }
  }
}

Player whoIsTheWinner(color c){
  if(c == playerOne.getColor()){
    print("yellowWins");
    winnerString = "the winner is yellow!";
    playerOne.addWin();
    return playerOne;
  }
  if(c == playerTwo.getColor()){
    print("redWins");
    winnerString = "The winner is red!";
    playerTwo.addWin();
    return playerTwo;
  }
  //int totalParts = rows * columns; 
  //int counter = 0; 
  //for (int x = 0; x < rows; x++){
  //  for (int y = 0; y < columns; y++){
  //    if (board[x][y].getColor() != 250){
  //      counter++; 
  //    }
  //  }
  //}
  //if (counter == totalParts){
  //  print ("tie"); 
  //  winnerString = "It's a tie!"; 
  //  return tie; 
  //}
 int totalParts = rows*columns;
 int counter = 0;
 for(int x = 0 ; x< rows; x++){
   for(int y = 0; y < columns ; y++){
     counter++; 
     if(counter == totalParts){
       print("tie");
       winnerString = "It's a tie!";
       return tie;
       
     }
   }
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
            counter++;
            curColor = board[x][y].getColor();
          }  
          if( board[x][y].getColor()!=250&&board[x][y].getColor() == curColor){
            counter ++;
            
            if(counter == 4){
             
              if (winnerChosen == false){
                
            whoIsTheWinner(curColor);
         }
       
              return true;
            }
          }
          else if(board[x][y].getColor()!=curColor){
            counter = 0;
            curColor = board[x][y].getColor();
          
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
               if (winnerChosen == false){
            whoIsTheWinner(curColor);
         }
           
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
  
  for(int x = 0; x < rows-3; x++){
    color curColor = 0;
    for(int y = 0; y < columns-3; y++){
       if(board[x][y].getColor()!=250){
          curColor = board[x][y].getColor();
          
          
       }
        if(board[x+1][y+1].getColor() == curColor &&
             board[x+2][y+2].getColor() == curColor &&
             board[x+3][y+3].getColor() == curColor){
                if (winnerChosen == false){
            whoIsTheWinner(curColor);
         }
               return true;
             
             }
       
      }
    
    }
   for(int x = rows -1; x >=3; x--){
     color curColor = 0;
     for(int y = 0; y < columns-3; y++){
       if(board[x][y].getColor() !=250){
         curColor = board[x][y].getColor();
       }
       if(board[x-1][y+1].getColor() == curColor &&
       board[x-2][y+2].getColor() == curColor &&
       board[x-3][y+3].getColor() == curColor){
         if (winnerChosen == false){
            whoIsTheWinner(curColor);
         }
        
         return true;
       
       }
       
       
   }    
   
   }
    int totalParts = rows*columns;
   if(presses == totalParts){
     whoIsTheWinner(0);
     return true;
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
    playerOne.resetTurn();
    playerTwo.resetTurn();
}
