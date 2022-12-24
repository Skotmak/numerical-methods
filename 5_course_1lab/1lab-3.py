# Методы одномерной оптимизации
# Метод золотого сечения
from scipy import optimize
from numpy import sqrt
import math as m

a = -2
b = 3
fi = (1 + sqrt(5.0)) / 2
step = 0
eps = 0.001


def func(x):
    # f = x**2 # можно использовать и эту функцию
    f = m.sin(x)
    return f


while abs(b - a) >= eps:
    step += 1
    y = b - (b - a) / fi
    z = a + (b - a) / fi
    if func(y) >= func(z):
        a = y
    else:
        b = z
c = (a + b) / 2
ans = func(c)
print(f'f(c) = {ans}\nc = {c}\nSteps: {step}')

# Готовый вариант просчёта
y = b - (b - a) / fi
z = a + (b - a) / fi
minimum = optimize.golden(func, brack=(y, z), full_output=True)
print(f'golden: {minimum}')
