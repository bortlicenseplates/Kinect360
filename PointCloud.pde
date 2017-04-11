class Cloud implements IControls{
  int skip;
  float x,y,z;
  float lLim, uLim;
  
  Cloud(){
  }
  
  void scan(int[] pxls){
    for (int i = 0; i < pxls.length; i++){
      if (brightness(pxls[i]) > lLim && brightness(pxls[i]) < uLim){
      }
    }
  }
  
}