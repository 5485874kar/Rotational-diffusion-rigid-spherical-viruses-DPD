 program entdat
      integer nmax, u
      parameter (nmax=N-of-P, u=20)
      integer a(nmax),b(nmax)
      real*8 x(nmax), y(nmax), z(nmax),vx(nmax),vy(nmax),vz(nmax),fx(nmax),Ixx(nmax), Iyy(nmax), ... !list all variables
      boxl=30
      boyl=17
      K=0.333333343d0
open (u, FILE='*espace-z.data', STATUS='OLD')
do i=1,nmax
      read(u,*) a(i),x(i),y(i),z(i),vx(i),vy(i),vz(i)  
enddo
     

    
open(65,file='*e-velocidad-angular.data',status='unknown')
xx=0
yy=0
zz=0 ! ... list all variables equal to zero
do i=1,nmax 
Ixx(i)=(y(i)**2.d0+z(i)**2.d0)
xx=xx+Ixx(i)
Iyy(i)=(z(i)**2.d0+x(i)**2.d0)
yy=yy+Iyy(i)
Izz(i)=(x(i)**2.d0+y(i)**2.d0)
zz=zz+Izz(i)
Iyx(i)=-x(i)*y(i)
yx=yx+Iyx(i)
Ixy(i)=Iyx(i)
xy=yx
Izx(i)=-x(i)*z(i)
zx=zx+Izx(i)
Ixz(i)=Izx(i)
xz=zx
Iyz(i)=-y(i)*z(i)  
yz=yz+Iyz(i)
Izy(i)=Iyz(i)
zy=yz
!angular moment
Lx(i)=(y(i)*vz(i))-(z(i)*vy(i))
Lxx=Lxx+Lx(i)
Ly(i)=-(x(i)*vz(i))+(z(i)*vx(i))
Lyy=Lyy+Ly(i)
Lz(i)=(x(i)*vy(i))-(y(i)*vx(i))
Lzz=Lzz+Lz(i)
enddo
!inverse matrix I to A
II=(xx*yy*zz)+(xy*yz*zx)+(xz*yx*zy)-(xz*yy*zx)-(xx*yz*zy)-(xy*yx*zz)
A11=((yy*zz)-(zy*yz))/II
A22=((xx*zz)-(xz*zx))/II
A33=((xx*yy)-(xy*yx))/II
A12=-((xy*zz)-(xz*zy))/II
A13=((xy*yz)-(yy*zx))/II
A21=-((yx*zz)-(zx*yz))/II
A23=-((xx*yz)-(yx*xz))/II
A31=((yx*zy)-(zx*yy))/II
A32=-((xx*zy)-(zx*xy))/II
 
 wx=A11*Lxx+A21*Lyy+A31*Lzz
 wy=A12*Lxx+A22*Lyy+A32*Lzz
 wz=A13*Lxx+A23*Lyy+A33*Lzz

w=sqrt(wx*wx+wy*wy+wz*wz)
write(65,*)wx,wy,wz,w,Lxx,Lyy,Lzz
      close(51)     
      
      close (u)


100   format(3f15.7)
      end
      

      
      
      
      
      
      
