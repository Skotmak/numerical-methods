program spusk

implicit none
integer:: i, counter
real:: alpha, delta, xk, xknext, minimum, minx, theta, ftemp, d1, alpha0, alpha1, beta0, d0
real, parameter::eps = 0.001

xknext = 100.0
xk = xknext - 50 ! Это делается для того, чтобы у нас программа вошла в цикл
alpha = 1
delta = 0.001
theta = 0.01

counter = 0

do while (abs(xknext - xk) >= eps)
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



minimum = f(-100.0)
minx = -100



do i = 1, 10000 ! это цикл

    xk = -100 + 200 * i / 10000
    if (minimum > f(xk)) then
        minimum  = f(xk)
        minx = xk
    endif
enddo

write(*, '(1a, f12.4, 1a, f12.4, 1a)') 'Exact function minimum is at point', minx, &
& '. Exact minimum value is is ', minimum, '.'

print*, '-----------------------'
print*, ' '
print*, ' '
print*, ' '


xknext = 100.0
xk = xknext - 50 ! Это делается для того, чтобы у нас программа вошла в цикл
delta = 0.0165665
counter = 0

do while (abs(xknext - xk) >= eps)
    counter = counter + 1
    xk = xknext
    xknext = xk - delta * (f(xk + delta) - f(xk)) / &
    &(f(xk + 2 * delta) - 2 * f(xk + delta) + f(xk))
    print*, xknext

enddo

write(*, '(1a, f12.4, 1a, f12.4, 1a)') 'Function minimum is at point', xknext, &
& '. Minimum value is is ', f(xknext), '.'
print*, 'This was made in ', counter, ' steps.'

print*, '-----------------------'
print*, ' '
print*, ' '
print*, ' '

open(100, file = 'deltas.txt')
open(101, file = 'xk.txt')
open(102, file = 'iterations_counter.txt')

do while (delta < 1)
    call newton
    if (xknext < huge (xknext)) then
        write(100, *) delta
        write(101, *) xknext
        write(102, *) counter
    endif
    delta = delta + 0.01
enddo

write(*, '(1a, f12.4, 1a, f12.4, 1a)') 'Function minimum is at point', xknext, &
& '. Minimum value is is ', f(xknext), '.'
print*, 'This was made in ', counter, ' steps.'

print*, '-----------------------'
print*, ' '
print*, ' '
print*, ' '

xknext = 100.0
xk = xknext - 50 ! Это делается для того, чтобы у нас программа вошла в цикл
d0 = (f(xk + delta) - f(xk)) / delta

!здесь мы закончили

!xknext = 2 *xk
beta0 = (f(xknext + delta) - f(xknext)) / (f(xk + delta) - f(xk))
d1 = - (f(xknext + delta) - f(xknext)) / delta + beta0 * (-(f(xk + delta) - f(xk)) / delta)
alpha0 = xk * delta / (f(xk + delta) - f(xk))
alpha1 = xknext / d1
xk = - (f(xknext + delta) - f(xknext)) / delta + alpha1 * d1

print*, xk


contains
    real function f(x)
    
        real, intent(in):: x
        
        f = (x -3) ** 2
        
    end function

    subroutine newton

    xknext = 100.0
    xk = xknext - 50 ! Это делается для того, чтобы у нас программа вошла в цикл
    counter = 0

    do while (abs(xknext - xk) >= eps)
        counter = counter + 1
        xk = xknext
        xknext = xk - delta * (f(xk + delta) - f(xk)) / &
        &(f(xk + 2 * delta) - 2 * f(xk + delta) + f(xk))
    print*, xknext

    enddo

    end subroutine

end program

