 program entdat

      integer nmax, u
      parameter (nmax=10002, u=20)
      integer a(nmax),b(nmax),delta,step
      real*8 w(nmax),wx(nmax),wy(nmax),wz(nmax),Lz(nmax),Lx(nmax),Ly(nmax),boxl,thetax(nmax),thetay(nmax),thetaz(nmax)
      !delta= dump on timesteps which are multiples of N
      delta=1000
! Abrir el archivo de datos
      open (u, FILE='velocidad-angular-all-frames.data', STATUS='OLD')
    do i=1,nmax
!  Leer el número de puntos
      read(u,*) wx(i),wy(i),wz(i),w(i),Lx(i),Ly(i),Lz(i)
           wx(i)=wx(i)
           wy(i)=wy(i)
           wz(i)=wz(i)
           w(i)=w(i)
           Lx(i)=Lx(i)
           Ly(i)=Ly(i)
           Lz(i)=Lz(i)
    enddo
	    
open(51,file='time-realsim-vel-angular.data',status='unknown')
step=0.d0
!i frames
do i=1,nmax
thetax(i)=wx(i)*delta*0.03
thetay(i)=wy(i)*delta*0.03
thetaz(i)=wz(i)*delta*0.03
write(51,*) i-1, thetax(i), thetay(i), thetaz(i)
enddo
      close(51)

open(51,file='components-vector-rt.data',status='unknown')
Dthetax=0.d0
Dthetay=0.d0
Dthetaz=0.d0
do i=1,nmax
Dthetax=Dthetax+thetax(i)
Dthetay=Dthetay+thetay(i)
Dthetaz=Dthetaz+thetaz(i)
print*, thetax(i)
write(51,*) i-1, Dthetax, Dthetay, Dthetaz
enddo
      close(51)
      close (u)


100   format(3f15.7)
      end
