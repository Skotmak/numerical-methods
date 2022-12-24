program RungeKutta
integer, parameter::n = 10
integer::i
real, parameter::x0 = 0.0, y0 = -2.0
real, parameter::h = 0.2
real::x, y, yw
real::k1, k2, k3, k4  ! Коэффициенты Рунге-кутта

open(101, file = 'tochnoe.txt') ! открываем файл 'tochnoe.txt'
open(102, file = 'euler.txt') ! открываем файл 'euler.txt'
open(103, file = 'predcorr.txt') ! открываем файл 'predcorr.txt'
open(104, file = 'rk4.txt') ! открываем файл 'rk4.txt'
x = x0
y = y0
do i = 1, n
    yw = y + h*f(x, y)
    write(102, *) y
    x = x + h  ! следующая точка, равная предыдущей + шаг
    write(101, *) - x**3 - 2
enddo
x = x0
y = y0
do i = 1,n
    yw = y + h*f(x, y)
    y = y + h*(f(x, y) + f(x+h, yw))/2
    x = x + h
    write(103,*) y
enddo
x = x0
y = y0
do i = 1,n
    k1 = f(x, y)
    k2 = f(x + h/2, y + h/2*k1)
    k3 = f(x + h/2, y + h/2*k2)
    k4 = f(x + h, y + h*k3)
    x = x + h
    y = y + h/6*(k1 + 2*k2 + 2*k3 + k4)
    write(104,*) y
enddo
close(101) ! закрываем файл 'tochnoe.txt'
close(102) ! закрываем файл 'euler.txt'
close(103) ! закрываем файл 'predcorr.txt'
close(104) ! закрываем файл 'rk4.txt'
contains 
real function f(x, y)
    real, intent(in):: x, y
    f = 3*x**2 / (x**3 + y + 1)
end function f
end program