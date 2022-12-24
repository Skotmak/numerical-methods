program Lagrange
real, parameter :: pi = 3.1414, h = pi/7
real, dimension(5) :: yzli = (/0.5*h, 1.5*h, 2.5*h, 4.5*h, 6.5*h/)
! массив узлов интерполяции
real, dimension(5) :: znacheniya, raznosti
! массив значений функции в узлах интерполяции
integer :: i,j
real :: summa, proizvedenie ! сумма и произведение из формулы
integer, parameter :: n = 100
real, dimension(n) :: x ! массив точек разбиения (переменной х)

! заполняем массив значений функции по циклу
do i = 1, 5
znacheniya(i) = sqrt(yzli(i)) * sin(yzli(i)) + 1
enddo

open(101, file = 'Newton-x.txt')
do i = 1, n
x(i) = 2* pi * i / n
write(101, *) x(i)
enddo

open(100, file = 'Newton-fynkciya.txt') ! открываем файл
do i = 1, n
write(100, *) sqrt(x(i)) *sin(x(i)) + 1
enddo
open(102, file = 'Newton.txt') ! файл с массивом значений многочлена Лагранджа

raznosti = 0

do i = 1, 5 ! номер разделенной разности (т.е. от скольки переменных)
    do j = 1, i ! счётчик суммы
        proizvedenie = 1
        do k = 1, i ! счётчик произведения
            if (j /= k) then
                proizvedenie = proizvedenie * (yzli(j) - yzli(k))
            endif
        enddo
            raznosti(i) = raznosti(i) + (sqrt(yzli(j)) * sin(yzli(j)) + 1) / proizvedenie
    enddo
enddo

print*, 'f(x0;x1)', raznosti(2)
print*, 'vtoroe ', (sqrt(yzli(1)) * sin(yzli(1)) + 1) / (yzli(1) - yzli(2)) &
& + (sqrt(yzli(2)) * sin(yzli(2)) + 1) / (yzli(2) - yzli(1))
print*, 'eshe vtoroe ', (sqrt(yzli(2)) * sin(yzli(2)) + 1 - (sqrt(yzli(2)) * sin(yzli(2)) + 1) / (yzli(2) - yzli(1)))

do k = 1, n ! цикл по разбиению
    summa = 0
    do i = 1, 5 ! цикл по слагаемым для каждого х
        proizvedenie = 1
        do j = 1, i-1 ! цикл по скобкам
            proizvedenie = proizvedenie * (x(k) - yzli(j))
        enddo
        summa = summa + raznosti(i) * proizvedenie
    enddo
    write(102, *) summa
enddo

close(102)
close(100) ! закрываем файл fynkciya.txt
close(101) ! закрываем файл x.txt


!print*, yzli()
end program