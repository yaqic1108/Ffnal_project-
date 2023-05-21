
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
  size(1080,720);
}
void draw(){
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
    //if(key == CODED){
    //  if(key == UP){
    //    rows = rows + 1 ;
    //    println( rows);
    //  }
    //  if(key==ENTER || key == RETURN){
    //    rows = int(rowString);
    //    println(rows);
    //    rowsChosen = true;
    
    //}
    
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
  

  
 

  
