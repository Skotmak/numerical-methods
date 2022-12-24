program gradientniy_spusk

implicit none

real::xk, xknext, alpha, a, b, z
real:: eps
integer:: step_count
a = -3.0
b = 5.0
eps = 0.001

call random_number(z) ! случайное число от 0 до 1
xknext = b - 0.5 * z ! случайное число в окрестности точки b (слева)
xk = a - 100
alpha = 0.5 ! метод постоянного параметра
step_count = 0
do while (abs(f(xknext) - f(xk)) >= eps)

    step_count = step_count + 1
    xk = xknext
    print*, 'fpr = ', fpr(xk)
    xknext = xk - alpha * fpr(xk)
    print*, 'on the step ', step_count, ' intermediate value is ', xk
    print*, 'abs(xk - xknext) = ', abs(f(xknext) - f(xk))


enddo

write(*, '(1a, f12.8, 1a) ') 'The function reaches a minimum at the point ', xknext, '.'
print*, 'Number of steps: ', step_count, '.'
contains
    real function f(x)
        real, intent(in)::x
        f = x**2-1

    end function f
	
    real function fpr(x)
        real, intent(in)::x !это коэффициент для улучшения сходимости

        fpr = (f(x + eps) - f(x - eps)) / (2 * eps)

    end function fpr

end program
