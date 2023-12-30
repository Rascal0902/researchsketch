float t,move=0,app=0.0001;
float[] M=  new float[100];
float[][] H = new float[1000][1000];
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
    Bezier2D(200,500,350,50,450,900,600,200,800,500,1);
    stroke(255,0,0);
    line(200,500,800,500);
    fill(255,0,0);
    textSize(50);
    text("L",500,550);
    stroke(0,0,255);
    strokeWeight(10);
    point(maxx,maxy);
    fill(0,0,0);
    textSize(20);
    text("r_i(t_(1/2))",maxx-30,maxy-20);
    strokeWeight(5);
    line(maxx,maxy,maxx,500);
}
void Bezier2D(float x0,float y0,float x1,float y1,float x2,float y2,float x3,float y3,float x4,float y4,float num)
{
  strokeWeight(6);
  stroke(0);
  //point(x0,y0);
  fill(0,0,0);
  textSize(20);
  text("r_i(0)",x0-50,y0-20);
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
  //point(x3,y3);
  fill(0,0,0);
  textSize(20);
  //text("P3",x3+10,y3-20);
  //text((int)num,x3+45,y3-20);
  //point(x4,y4);
  fill(0,0,0);
  textSize(20);
  text("r_i(1)",x4+10,y4-20);
  //text((int)num,x4+45,y4-20);
  float z,w,t=0;
  int o=0;
  for(t=0;t<=1;t+=0.0005)
  {
    z=t*t*t*t*x0+4*t*t*t*(1-t)*x1+6*t*t*(1-t)*(1-t)*x2+4*t*(1-t)*(1-t)*(1-t)*x3+(1-t)*(1-t)*(1-t)*(1-t)*x4;
    w=t*t*t*t*y0+4*t*t*t*(1-t)*y1+6*t*t*(1-t)*(1-t)*y2+4*t*(1-t)*(1-t)*(1-t)*y3+(1-t)*(1-t)*(1-t)*(1-t)*y4;
    if(w<=maxy)
    {
      maxt=t;
      maxx=z;
      maxy=w;
    }
    stroke(0,0,0);
    strokeWeight(5);
    point(z,w);
    o+=1;
  }
}
