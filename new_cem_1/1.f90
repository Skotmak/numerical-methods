program lab_one
implicit none
real:: a, b, c, minmin, y, z, formula, fi, r
integer:: N, i, steps
real, parameter:: eps = 0.0001 !точность алгоритма
character:: z_donbas
a = -4
b = 1          
N = 100
steps = 0


c  = (a + b) / 2
y = a
z = b
do while (abs(y - z) > eps)
steps = steps + 1
    y = (a + c) / 2
    z = (b + c) / 2

    if (f(y) <= f(z)) then
        a = a
        b = c
        c = y
    else
        if(f(z) <= f(y)) then
            a = c
            b = b
            c = z
            else
                a = y
                b = z
                c = c
            endif
    endif



enddo

!print*, 'aproximate value (dihotomy)', f((y + z) / 2)
write(*,'(1a,f12.8)') 'dih', (y+z)/2
print*, 'steps', steps

a = -4
b = 4

fi = (1 + sqrt(5.0)) / 2
c  = (a + b) / 2
steps = 0
y = a
z = b

do while (abs(y - z) > eps)

steps = steps + 1
y = b - (b - a) / fi
z = a + (b - a) / fi

    if (f(y) <= f(z)) then
        a = a
        b = c
        c = y
    else
        if(f(z) <= f(y)) then
            a = c
            b = b
            c = z
            else
                a = y
                b = z
                c = c
            endif
    endif



enddo

!print*, 'zolotoe sechenie', f((y + z) / 2)
print*, 'zolotoe sechenie', min(f(z - (z - y) / fi), f(z + (z - y) / fi))
print*, 'steps', steps

r = (3 - sqrt(5.0)) / 2
c  = (a + b) / 2
y = a
z = b
do while (abs(y - z) > eps)
steps = steps + 1
    y = a + r * (b - a)
    z = b - r * (b - a)

    if (f(y) <= f(z)) then
        a = a
        b = c
        c = y
    else
        if(f(z) <= f(y)) then
            a = c
            b = b
            c = z
            else
                a = y
                b = z
                c = c
            endif
    endif



enddo

!print*, 'metod zol2', f((y + z) / 2)
!print*, 'zolotoe sechenie', min(f(z - (z - y) / fi), f(z + (z - y) / fi))
write(*,'(1a,f12.8)') 'zol sech', (y+z)/2
print*, 'steps', steps

do i = 1,N
formula =  a + (b - a) * i / N
    if (f(formula)<minmin)then 
        minmin=f(formula)
    end if
end do
print*, minmin
print*, 'exact', 0
print*, 'press f'
write (*,*) z_donbas

contains



real function f(x)
    real, intent(in):: x
 f =x**2-1.0/3

end function f


end program
 
 
 
 
