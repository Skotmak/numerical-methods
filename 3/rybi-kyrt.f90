program rybikyrt
integer, parameter::n = 100
integer::i
real, parameter::x0 = 0, y0 = -2
real, parameter::h = 10.0 / n
real::x, y, yk


open(101, file = 'tochnoe.txt') ! открываем файл
open(102, file = 'euler.txt') ! открываем файл
x = x0
y = y0
do i = 1, n
    yk = y + h * f(x, y)
    write(102, *) y
    y = yk
    x = x + n !следующая точка, равная предыдущей + шаг
    write(101, *) - x**3 - 2
enddo

close(101)
close(102)

contains 

real function f(x, y)
    real, intent(in):: x, y
	
    f = 3*x**2 / (x**3 + y + 1)
	
	
end function f

end program
