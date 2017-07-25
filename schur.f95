program schur_1

     INTEGER ::INFO,i,j
     INTEGER,DIMENSION(1) :: IWORK2
     LOGICAL,DIMENSION(1,1) :: BWORK3
     REAL::SRCONE, RCONV
     REAL,DIMENSION(20) :: WR, WI
     REAL,DIMENSION(300)::WORK
     REAL,DIMENSION(20,20) :: A, Z
     BWORK3(1,1)=.false.

     do i=1,20,1
        do j=1,20,1
            A(i,j)=1.0
        enddo
     enddo
    call SGEESX('V', 'N', p, 'N', 20, A, 20, 0, WR,WI, Z,20, SRCONE, RCONV, WORK, 300, IWORK2,1, BWORK3,INFO)

    if (INFO==0) then
        print*,"no errors occured"
        print*,A
        print*,Z
    else
        stop
    endif

    
end program schur_1

LOGICAL  function p(args)
    LOGICAL :: args
    
end function p