program Lagrange
real, parameter::pi = 3.1415, h = pi/7
real, dimension (6) :: yzli = (/0.5*h, 1.5*h, 2.5*h, 4.5*h, 5.5*h, 6.5*h/)
! массив узлов интерполяции
real, dimension(6) :: znacheniya
!массив значений функции в узлах интерполяции
integer::i,j
real::summa, proizv !сумма и произведение
integer, parameter::n = 100
real,dimension(n)::x !массив  точек разбиения (переменной х)

!заполняем массив значений функции по циклу
do i = 1,6
znacheniya(i) = sqrt(yzli(i))*sin(yzli(i))+1
enddo

open(101,file='x.txt')
do i = 1,n
x(i) = 2*pi*i/n
write(101,*) x(i)
enddo

open(100, file ='fynciya.txt') !открываем файл
do i =1,n
write(100,*) sqrt(x(i))*sin(x(i))+1
enddo
open(102, file ='Lagrange.txt') !открываем файл с массивом значений многочлена Лагранжа
do k = 1,n
summa = 0
do i = 1,6
proizv = 1
do j = 1,6
if ( j /= i) then
proizv = proizv * (x(k) - yzli(j))/(yzli(i)-yzli(j))
!пересчет произведения внутри формулы
endif
enddo
summa = summa + znacheniya(i) * proizv
!пересчет суммы внутри формулы
enddo
write(102,*) summa
enddo
close(102)


close(100)!закрываем файл fynkciya.txt
close(101)!закрываем файл x.txt


print*, yzli
end program
