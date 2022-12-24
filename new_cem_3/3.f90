program spusk

implicit none
integer:: i, counter
real:: alpha, delta, xk, xknext, minimum, minx, theta, ftemp
real, parameter::eps = 0.001

xknext = 100.0
xk = xknext - 50 ! Это делается для того, чтобы у нас программа вошла в цикл
alpha = 1
delta = 0.001
theta = 0.01

counter = 0

do while (abs(xknext - xk) >= eps)
!do while (abs(f(xknext) - f(xk)) >= eps)

    xk = xknext
    
    counter = counter + 1
    
    
    do while (alpha > eps)
        
        ftemp = (f(xk + delta) - f(xk)) / delta
        if (f(xk - alpha * ftemp) <= f(xk) - eps * alpha * ftemp ** 2) then
            exit
        else
            alpha = theta * alpha
        endif
    enddo

    xknext = xk - alpha * (f(xk + delta) - f(xk))/ delta ! Формула с доски

enddo



write(*, '(1a, f12.4, 1a, f12.4, 1a)') 'Function minimum is at point', xknext, &
& '. Minimum value is is ', f(xknext), '.'
print*, 'This was made in ', counter, ' steps.'


!minimum = f(xknext)
minimum = f(-100.0)
!minx = xknext
minx = -100


!do i = 1, int(1 / eps)
do i = 1, 10000
    !xk = xknext + (-1) ** i * eps * i
    xk = -100 + 200 * i / 10000
    if (minimum > f(xk)) then
        minimum  = f(xk)
        minx = xk
    endif
enddo

write(*, '(1a, f12.4, 1a, f12.4, 1a)') 'Exact function minimum is at point', minx, &
& '. Exact minimum value is is ', minimum, '.'

contains
    real function f(x)
    
        real, intent(in):: x
        
        f = (x -3) ** 2
        
    end function

end program
