# метод проекции градиента
import numpy as np
import time


def fx(xk, yk):
    func = xk**2 - yk**2
    return func


def dfdx(xk, eps, yk):
    func2 = (fx(xk + eps, yk) - fx(xk, yk)) / eps
    return func2


def dfdy(xk, eps, yk):
    func3 = (fx(xk, yk + eps) - fx(xk, yk)) / eps
    return func3


def xk_plus_one(xk, alf, eps, y):
    global x_k_plus_one
    x_k_plus_one = xk - alf * dfdx(xk, eps, y)
    return x_k_plus_one


def yk_plus_one(yk, alf, x, eps):
    global y_k_plus_one
    y_k_plus_one = yk - alf * dfdy(x, eps, yk)
    return y_k_plus_one


xk = 1 / 2
yk = 1 / 2
eps = 0.001
alf = 0.6
step = 0
xk_plus_one(xk, alf, eps, yk)
#print(f'x_k_plus_one = {x_k_plus_one}')
test = np.sqrt((abs(xk - xk_plus_one(xk, alf, eps, yk)) ** 2 +
               abs(yk - yk_plus_one(yk, alf, xk, eps)) ** 2))
print(f'test = {test} и eps = {eps}')

while test >= eps:
    test = np.sqrt((xk - xk_plus_one(xk, alf, eps, yk) **
                   2 + yk - yk_plus_one(yk, alf, xk, eps) ** 2))
    print(f'test = {test}')
    cond = xk_plus_one(xk, alf, eps, yk) ** 2 + \
        yk_plus_one(yk, alf, xk, eps) ** 2
    print(f'cond = {cond} > 1')

    if cond > 1:
        xk = (xk_plus_one(xk, alf, eps, yk)) / (np.sqrt(cond))
        yk = (yk_plus_one(yk, alf, xk, eps)) / (np.sqrt(cond))
        #xk = (x_k_plus_one) / (np.sqrt(cond))
        #yk = (y_k_plus_one) / (np.sqrt(cond))
        print(f'xk = {xk}')
        print(f'yk = {yk}')
    else:
        xk = xk_plus_one(xk, alf, eps, yk)
        yk = yk_plus_one(xk, alf, xk, eps)
    step += 1
    print(f'step = {step}')
    time.sleep(2)

print(f'final_x_k_plus_one = {x_k_plus_one}')
print(f'final_y_k_plus_one = {y_k_plus_one}')
print(f'final step = {step}')
