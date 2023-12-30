float[] A = new float[6];
float ceta,pi;
void setup()
{
  size(1000,1000);
  background(0);
}
void draw()
{
  if(mouseButton==LEFT)
  {
    ceta=mouseX/1000.0*360.0;
    pi=mouseY/1000.0*360.0;
    background(0);
    strokeWeight(5);
    stroke(255);
    textSize(10);
    text("pi=",85,100);
    text("ceta=",85,120);
    text(pi,100,100);
    text(ceta,110,120);
  }
  coordinate3D();
  //spiral_curve();
  //circles();
  // Bezier move 3D();
}
void circles()
{
  float i,j;
  for(i=0;i<200;i+=20)
  {
    for(j=0;j<360;j+=1)
    {
      point3D_RGB(i*cos(radians(j)),0,i*sin(radians(j)),255,0,0,3);
    }
  }
  
}
void spiral_curve()
{
  float i;
  for(i=-1;i<=1;i+=0.001)
  {
    point3D_RGB(30*cos(radians(i*1000)),i*100,30*sin(radians(i*1000)),255,200-200*i,i*200,5);
  }
}
void coordinate3D()
{
  line3D(-300,0,0,300,0,0);
  line3D(0,-300,0,0,300,0);
  line3D(0,0,-300,0,0,300);
  textSize(20);
  stroke(255);
  fill(255,255,255);
  check3D(310,0,0);
  text("+x",500+A[0],500+A[1]);
  check3D(-310,0,0);
  text("-x",500+A[0],500+A[1]);
  check3D(0,310,0);
  text("+y",500+A[0],500+A[1]);
  check3D(0,-310,0);
  text("-y",500+A[0],500+A[1]);
  check3D(0,0,310);
  text("+z",500+A[0],500+A[1]);
  check3D(0,0,-310);
  text("-z",500+A[0],500+A[1]);
}
void point3D(float x,float y,float z)
{
  stroke(255);
  A[0]=x*sin(radians(ceta))-z*sin(radians(ceta));
  A[1]=y*cos(radians(pi))-x*sin(radians(pi))*sin(radians(ceta))-z*cos(radians(ceta))*sin(radians(pi));
  strokeWeight(10);
  stroke(255);
  point(500+A[0],500+A[1]);
}
void point3D_RGB(float x,float y,float z,float R,float G,float B,float st)
{
  stroke(255);
  A[0]=x*sin(radians(ceta))-z*sin(radians(ceta));
  A[1]=y*cos(radians(pi))-x*sin(radians(pi))*sin(radians(ceta))-z*cos(radians(ceta))*sin(radians(pi));
  strokeWeight(st);
  stroke(R,G,B);
  point(500+A[0],500+A[1]);
}
void line3D(float x,float y,float z,float w,float m,float n)
{
  stroke(255);
  A[2]=x*sin(radians(ceta))-z*sin(radians(ceta));
  A[3]=y*cos(radians(pi))-x*sin(radians(pi))*sin(radians(ceta))-z*cos(radians(ceta))*sin(radians(pi));
  A[4]=w*sin(radians(ceta))-n*sin(radians(ceta));
  A[5]=m*cos(radians(pi))-w*sin(radians(pi))*sin(radians(ceta))-n*cos(radians(ceta))*sin(radians(pi));
  strokeWeight(5);
  stroke(255);
  line(500+A[2],500+A[3],500+A[4],500+A[5]);
}
void check3D(float x,float y,float z)
{
  stroke(255);
  A[0]=x*sin(radians(ceta))-z*sin(radians(ceta));
  A[1]=y*cos(radians(pi))-x*sin(radians(pi))*sin(radians(ceta))-z*cos(radians(ceta))*sin(radians(pi));
}
void Bezier3D(float x0,float y0,float z0,float x1,float y1,float z1,float x2,float y2,float z2, float num)
{
  strokeWeight(6);
  stroke(#08FF16);
  point3D(x0,y0,z0);
  fill(255,255,255);
  textSize(20);
  check3D(x0+10,y0-20,z0-20);
  text("P0_",500+A[0],500+A[1]);
  text((int)num,500+A[0]+35,500+A[1]);
  strokeWeight(6);
  stroke(#08FF16);
  point3D(x1,y1,z1);
  fill(255,255,255);
  textSize(20);
  check3D(x1+10,y1-20,z1-20);
  text("P1_",500+A[0],500+A[1]);
  text((int)num,500+A[0]+35,500+A[1]);
  strokeWeight(6);
  stroke(#08FF16);
  point3D(x2,y2,z2);
  fill(255,255,255);
  textSize(20);
  check3D(x2+10,y2-20,z2-20);
  text("P2_",500+A[0],500+A[1]);
  text((int)num,500+A[0]+35,500+A[1]);
  float z,w,k,t=0;
  for(t=0;t<=1;t+=0.005)
  {
    z=t*t*x0+2*t*(1-t)*x1+(1-t)*(1-t)*x2;
    w=t*t*y0+2*t*(1-t)*y1+(1-t)*(1-t)*y2;
    k=t*t*z0+2*t*(1-t)*z1+(1-t)*(1-t)*z2;
    point3D_RGB(z,w,k,255,0,0,5);
  }
}
