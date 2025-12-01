 program entdat

      integer nmax, u
      parameter (nmax=10001, u=20)
      integer a(nmax),b(nmax),delta,step
      real*8 Dthetax(nmax),Dthetay(nmax),Dthetaz(nmax),boxl,msdr2,msdr,msdy,msdz
      real*8 theta,dx(nmax),dy(nmax),dz(nmax)
      delta=1000
      open (u, FILE='components-vector-rt.data', STATUS='OLD')
    do i=1,nmax
      read(u,*) a(i), Dthetax(i), Dthetay(i), Dthetaz(i)    
    enddo
	    

 open(51,file='msd-rotational-time-average.data',status='unknown')
step=0.d0
!nmax=Total number of frames
!j=frame separation
do j=1,nmax-1
 n=0
 deltatheta=0.d0
 msdr2=0.d0
 do i=1,nmax-j
 n=n+1
 dx(i)=Dthetax(i+j)-Dthetax(i)
 dy(i)=Dthetay(i+j)-Dthetay(i)
 dz(i)=Dthetaz(i+j)-Dthetaz(i)
 d=dx(i)*dx(i)+dy(i)*dy(i)+dz(i)*dz(i)
 msdr2=msdr2+d
 enddo
 msdr=msdr2/n
 write(51,*) j*1000*0.03,msdr
enddo
      close(51)
      close (u)

100   format(3f15.7)
      end
