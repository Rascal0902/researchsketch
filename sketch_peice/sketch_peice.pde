float t,move=0,app=0.0001;
float[] M=  new float[100];
float[][] H = new float[1000][1000];
float maxmin,min;
float[] A = new float[6];
float ceta,pi;
void setup()
{
  size(1000,1000);
  background(255);
}
void draw()
{
    Bezier2D(300,300,450,150,600,300,800,200,1);
    pointBezier2D(300,300,450,150,600,300,800,200,1);
}
void Bezier2D(float x0,float y0,float x1,float y1,float x2,float y2,float x3,float y3,float num)
{
  strokeWeight(6);
  stroke(0);
  point(x0,y0);
  fill(0,0,0);
  textSize(20);
  text("P0",x0+10,y0-20);
  //text((int)num,x0+45,y0-20);
  point(x1,y1);
  fill(0,0,0);
  textSize(20);
  text("P1",x1+10,y1-20);
  //text(( int)num,x1+45,y1-20);
  point(x2,y2);
  fill(0,0,0);
  textSize(20);
  text("P2",x2+10,y2-20);
  //text((int)num,x2+45,y2-20);
  point(x3,y3);
  fill(0,0,0);
  textSize(20);
  text("P3",x3+10,y3-20);
  //text((int)num,x3+45,y3-20);
  float z,w,t=0;
  int o=0;
  for(t=0;t<=1;t+=0.005)
  {
    z=t*t*t*x0+3*t*t*(1-t)*x1+3*t*(1-t)*(1-t)*x2+(1-t)*(1-t)*(1-t)*x3;
    w=t*t*t*y0+3*t*t*(1-t)*y1+3*t*(1-t)*(1-t)*y2+(1-t)*(1-t)*(1-t)*y3;
    if(o%40==0)
    {
       strokeWeight(10);
       stroke(255,0,0);
       point(z,w);
    }
    stroke(((int)(t*20))*10,0,255-((int)(t*20)));
    strokeWeight(5);
    point(z,w);
    o+=1;
  }
}
void pointBezier2D(float x0,float y0,float x1,float y1,float x2,float y2,float x3,float y3,float num)
{
  
  float z,w,t=0;
  int o=0;
  for(t=0;t<=1;t+=0.005)
  {
    z=t*t*t*x0+3*t*t*(1-t)*x1+3*t*(1-t)*(1-t)*x2+(1-t)*(1-t)*(1-t)*x3;
    w=t*t*t*y0+3*t*t*(1-t)*y1+3*t*(1-t)*(1-t)*y2+(1-t)*(1-t)*(1-t)*y3;
    if(o%40==0)
    {
       strokeWeight(10);
       stroke(255,0,0);
       point(z,w);
    }
    o+=1;
  }
}
