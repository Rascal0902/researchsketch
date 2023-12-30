float maxmin,min;
float[] A = new float[6];
float ceta,pi;
float maxt=0,maxx,maxy=1000;
void setup()
{
  size(1000,1000);
  background(255);
}
void draw()
{
    Bezier2D(400,500,700,50,600,500,1);
    stroke(0);
    strokeWeight(10);
    point(700,50);
    text("P1(b,c)",730,50);
    text("+u",910,500);
    text("-u",70,500);
    text("+v",500,80);
    text("-v",500,930);
    strokeWeight(5);
    line(500,100,500,900);
    line(100,500,900,500);
    /*fill(255,0,0);
    textSize(50);
    text("L",500,550);
    stroke(0,0,255);*/
    strokeWeight(10);
    point(maxx,maxy);
    fill(0,0,0);
    textSize(20);
    text("Q(b/2,c/2)",maxx-30,maxy-20);
    strokeWeight(5);
    /*line(maxx,maxy,maxx,500);*/
}
void Bezier2D(float x0,float y0,float x1,float y1,float x2,float y2,float num)
{
  strokeWeight(6);
  stroke(0);
  //point(x0,y0);
  fill(0,0,0);
  textSize(20);
  text("P0(-a,0)",x0-80,y0-20);
  //text((int)num,x0+45,y0-20);
  //point(x1,y1);
  fill(0,0,0);
  textSize(20);
  //text("P1",x1+10,y1-20);
  //text(( int)num,x1+45,y1-20);
  //point(x2,y2);
  fill(0,0,0);
  textSize(20);
  //text("P2",x2+10,y2-20);
  //text((int)num,x2+45,y2-20);
  text("P2(a,0)",x2+20,y2-20);
  float z,w,t=0;
  int o=0;
  for(t=0;t<=1;t+=0.0005)
  {
    z=t*t*x0+2*t*(1-t)*x1+(1-t)*(1-t)*x2;
    w=t*t*y0+2*t*(1-t)*y1+(1-t)*(1-t)*y2;
    if(w<=maxy)
    {
      maxt=t;
      maxx=z;
      maxy=w;
    }
    stroke(255,0,0);
    strokeWeight(5);
    point(z,w);
    o+=1;
  }
}
