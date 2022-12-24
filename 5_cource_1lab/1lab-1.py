# Методы одномерной оптимизации
# метод равномерного перебора по сетке
import numpy as np
N = 100
i = np.arange(1, N + 1)
imin = np.arange(1, N)
# print(i)
a = -1
b = 3


def func(x):
    f = x**2
    return f


def delta():
    delta_func = (b - a) / N
    # print(delta_func)
    return delta_func


#xmin = a
v = func(a)

for xi in i:
    # xnext = xi + (delta() / 2)
    xnext = a + xi * delta() - delta() / 2
    #print(f'func(xnext) = {func(xnext)}')
    #print(f'v = {v}')
    if func(xnext) < v:
        xmin = xnext
        # print(f'xmin = {xmin}')
        v = func(xnext)
        # print(f'f = {v}')

print(f'xmin = {xmin}')
print(f'f = {v}')
print('---------------------------')

xia = a

for xi in imin:
    xinext = xia + delta() / 2
    if func(xinext) < v:
        ximin = xia
        v = func(xia)
    xia = xinext


print(f'ximin = {ximin}')
print(f'f = {v}\n')
