# Методы одномерной оптимизации
# Метод дихотомии
# import sys
a = -1
b = 3
c = (a + b) / 2


def func(x):
    f = x**2
    return f


# epsilon = sys.float_info.epsilon
epsilon = 0.001
print(f'Epsilon = {epsilon}')

i = 0

while (b - a >= epsilon):
    i += 1
    x = (a + c) / 2
    y = (c + b) / 2
    if func(x) < func(y):
        b = c
        c = x
    elif func(x) > func(y):
        a = c
        c = y
    elif func(x) == func(y):
        a = x
        b = y
ans = func(c)
print(f'f(c) = {ans}\nc = {c}\nSteps: {i}')
