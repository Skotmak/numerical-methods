program odnomernaya
    implicit none ! тип строгий
    integer :: N=100, i, steps
    real :: a=-1, b=3, c, delta, xi, v, xmin, xinext, x, y, z, eps=0.001, fi
    
    xmin = a ! текущая точка минимума
    v = f(a) ! текущее значение минимума
    delta = (b - a) / N
    xi = a
    
    ! Метод равномерного перебора
    do i = 1, N - 1
        ! i = a + i * delta - delta/2 ! подсчёт новой точки сетки
        xinext = xi + delta/2 ! <-
        if (f(xi) < v) then
            xmin = xi
            v = f(xi)
        endif
        xi = xinext ! <-
    enddo
    write(*, '(1a,f12.8,1a,f12.8,1a)') 'The function has its minimum', v, ' at the point', xmin, '.'
    
    
    ! Метод дихотомии
    c = (a + b) / 2
    do while (b - a >= eps)
        x = (a + c) / 2
        y = (c + b) / 2
        if (f(x) < f(y)) then
            b = c
            c = x
        elseif (f(x) > f(y)) then
            a = c
            c = y
        else
            a = x
            b = y
        endif
    enddo
    write(*, '(1a,f12.8,1a,f12.8,1a)') 'The function has its minimum', f(c), ' at the point', c, '.'
    print*, 'This was mad in', i, 'steps'
    
    
    ! Метод золотого сечения
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
    
    print*, 'zolotoe sechenie', f((y + z) / 2)
    !print*, 'zolotoe sechenie', min(f(z - (z - y) / fi), f(z + (z - y) / fi))
    print*, 'steps', steps
    
    contains
        real function f(x)
            real, intent(in) :: x
            f = x**2
        end function
    end program