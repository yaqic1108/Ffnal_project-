boolean resolutionChosen = false;
boolean gridSizeChosen = false;
boolean rowsChosen = false;
boolean columnsChosen = false;
int rows = 0;
int columns = 0;

int[][] board = new int[rows][columns];
int num =0;
String str_num = "";

void setup(){
  fullScreen();
}

void draw(){
  chooseGridSize(); 
  if(rows > 20 || rows < 4&&rows!=0 || columns > 20 || columns < 4&&columns!=0){
    text(" dimensions are invalid, choose new numbers press space to reset", width/2, height /2 - 200);
  }
  else{drawGrid();}
   
}

void chooseGridSize(){
  //allowing user to choose grid size
  if(gridSizeChosen == false){
      background(0,0,0);
      fill(255); 
    if(rowsChosen == false){
         text("choose number of rows press enter to confirm, number must be greater than 4 and less than 20", width/2, height/2);
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
         }
      }
    }
   }
}

void drawGrid(){
  if (rows != 0 && columns != 0){
    background(62, 144, 255);
    for (int j = (height/(2*rows)); j <= height; j += (height/rows)){
      for (int i = (width/(2*columns)); i <= width; i += (width/columns)){
        fill(#98A8BF); 
        circle (i, j, (height/rows)-20); 
      }
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
