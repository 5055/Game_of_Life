cell[][] cell;
int tile =10;
int count= 50;
int ticks_per_update =10;

boolean timestop;
int t=0;
void setup(){
  cell = new cell[count][count];
  size(500,500);
  for(int i =0; i<count; i++){
      for(int j =0; j<count; j++){
        boolean act =false;
        if((int)random(0,2) == 1){
         act = true;
        }
    cell[i][j] = new cell(i,j,act,false); 
      }
  }
}

void draw(){
    background(0);
      for(int i =0; i<count; i++){
      for(int j =0; j<count; j++){
        if(cell[i][j].active){
          fill(255);
          rect(i*tile,j*tile,tile,tile);
      }
    }
    }
  if(!timestop){
  if(t%ticks_per_update ==0){

        for(int i =0; i<count; i++){
      for(int j =0; j<count; j++){
        int buurcount=0;
        for(int k =-1; k<2; k++){
      for(int l =-1; l<2; l++){
        if(cell[(i+k+count)%count][(j+l+count)%count].active){
          buurcount++;
          
        }
      }
        }
        if (buurcount >4){
          cell[i][j].nactive = false;
        }
               else if (buurcount <3){
          cell[i][j].nactive = false;
        }
               else if ((buurcount ==3|| buurcount ==4)&& cell[i][j].active){
          cell[i][j].nactive = true;
        }
               else         if ( buurcount ==3&& !cell[i][j].active){
          cell[i][j].nactive = true;
        }
        
    }
    }
            for(int i =0; i<count; i++){
      for(int j =0; j<count; j++){
        cell[i][j].active = cell[i][j].nactive;
      }
            }
}
t++;
}
}
class cell {
      int xpos;
  int ypos;
  boolean active;
  boolean nactive;
 cell(int x,int y,boolean act,boolean nact) {
    xpos = x;
  ypos = y;
  active = act;
  nactive = nact;
  
 }

  
}


void mouseClicked(){
    if(mouseButton == RIGHT) {
  int clickX = mouseX/tile;
  int clickY = mouseY/tile;
  
          for(int k =-5; k<6; k++){
      for(int l =-5; l<6; l++){
        boolean act = false;
                if((int)random(0,2) == 1){
         act = true;
        }
        cell[(clickX+k+count)%count][(clickY+l+count)%count].active = act;
        
      }
          }
          
          
    }
              if(mouseButton == LEFT) {
      if (!timestop) {
    timestop = true;
  } else {
    timestop = false;
  }
  }

  
}
void mouseDragged(){
  if(mouseButton == RIGHT) {
    int clickX = mouseX/tile;
  int clickY = mouseY/tile;
  
  cell[(clickX+count*10)%count][(clickY+count*10)%count].active = true;
  }
}
