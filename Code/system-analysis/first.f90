program entdat
      integer nmax, u
      !nmax= number of particles as appropriate
      parameter (nmax=N-of-P, u=20)
      integer a(nmax),b(nmax)
      real*8 x(nmax), y(nmax),z(nmax),vx(nmax),vy(nmax),vz(nmax),boyl,boxl,x2,x1,y2,y1,z1,z2,z3,z4
      boxl=30
      boyl=17     

!* represents the corresponding frame
open (u, FILE='*etotal.data', STATUS='OLD')
do i=1,nmax
      read(u,*) a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
            x(i)=x(i)-boxl*dnint(x(i)/boxl)
            z(i)=z(i)-boxl*dnint(z(i)/boxl) 
enddo
!real negatives
!real positives
x1=0
x2=0
do i=1,nmax
if (x(i)<=0) then
x1=x1+ x(i)*x(i)
else if (x(i)>=0) then 
x2=x2+x(i)*x(i)
endif
enddo

   open(51,file='*espace-x.data',status='unknown')    
  do i=1,nmax 
if (x1>x2) then
   if(x(i)>=0) then
   x(i)=x(i)-boxl
    
        if (abs(x(i))<=(2*boxl)/3) then
        write(51,*)a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
        else if (abs(x(i))>=(2*boxl)/3)) then
        x(i)=x(i)+boxl
        write(51,*)a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
        endif
    
   else if (x(i)<=0)then
   write(51,*)a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
   endif
else if (x1<x2) then 
    if(x(i)<=0) then
    x(i)=x(i)+boxl
     
        if (abs(x(i))<=(2*boxl)/3)) then 
       write(51,*)a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
       else if (abs(x(i))>=(2*boxl)/3)) then
       x(i)=x(i)-boxl
       write(51,*)a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
       endif
    
    else if (x(i)>=0) then
    write(51,*)a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
    endif
endif 
  enddo 
    close (51)
    close (u)

    open (u, FILE='*espace-x.data', STATUS='OLD')
       do i=1,nmax
       read(u,*) a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
            a(i)=a(i)
            
            x(i)=x(i)
            y(i)=y(i)
            z(i)=z(i)
            vx(i)=vx(i)
            vy(i)=vy(i)
            vz(i)=vz(i)   
        enddo
z1=0
z2=0
do i=1,nmax
if (z(i)<=0) then
z1=z1+ z(i)*z(i)
else if (z(i)>=0) then 
z2=z2+z(i)*z(i)
endif
enddo   

     open(51,file='*espace-z.data',status='unknown')    
  do i=1,nmax 
if (z1>z2) then
   if(z(i)>=0) then
   z(i)=z(i)-boxl
    
        if (abs(z(i))<=(2*boxl)/3)) then
        write(51,*)a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
        else if (abs(z(i))>=(2*boxl)/3)) then
        z(i)=z(i)+boxl
        write(51,*)a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
        endif
    
   else if (z(i)<=0)then
   write(51,*)a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
   endif
else if (z1<z2) then 
    if(z(i)<=0) then
    z(i)=z(i)+boxl
     
       if (abs(z(i))<=(2*boxl)/3)) then 
       write(51,*)a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
       else if (abs(z(i))>=(2*boxl)/3)) then
       z(i)=z(i)-boxl
       write(51,*)a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
       endif
    
    else if (z(i)>=0) then
    write(51,*)a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)
    endif
endif 
  enddo 
 
    close (51)
    close (u)


        
100   format(3f15.7)
      end     
    
    
