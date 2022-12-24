program lab_two
implicit none
real:: a, b, c, minmin, y, z, formula, r
integer:: N, i, steps
real, parameter:: eps = 0.0001 !точность алгоритма
character:: z_donbas
a = -4
b = 4          
N = 100
steps = 0

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

print*, 'aproximate value (dihotomy)', f((y + z) / 2)
print*, 'steps', steps





do i = 1,N
formula =  a + (b - a) * i / N
    if (f(formula)<minmin)then 
        minmin=f(formula)
    end if
end do
print*, minmin
print*, 'press f'
write (*,*) z_donbas

contains



real function f(x)
    real, intent(in):: x
 f = sin(x)

end function f


end program
 
 
 
 
