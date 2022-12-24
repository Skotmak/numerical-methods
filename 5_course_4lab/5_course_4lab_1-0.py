import random


def f_x(xk):
    f_from_x = (xk - 3) ** 2 - 4
    return f_from_x


def f_dot_x(xk_eps, xk, eps):
    f_dot_from_x = (f_x(xk_eps) - f_x(xk)) / eps
    return f_dot_from_x


def f_2dot_x(xk_2eps, xk_eps, xk, eps):
    f_2dot_from_x = (f_x(xk_2eps) - 2 * f_x(xk_eps) + f_x(xk)) / (eps ** 2)
    return f_2dot_from_x


def func_xk_plus_1(xk_2eps, xk_eps, xk, eps):
    xk_plus_1 = xk - (f_dot_x(xk_eps, xk, eps)) / \
        (f_2dot_x(xk_2eps, xk_eps, xk, eps))
    return xk_plus_1


xk = random.randint(-20, 20)
eps = 0.01
xk_eps = xk + eps
xk_2eps = xk + 2 * eps
print(func_xk_plus_1(xk_2eps, xk_eps, xk, eps))
print(3-func_xk_plus_1(xk_2eps, xk_eps, xk, eps))

# добавь условие вайл (фотка с телефона) и внутрь всё что выше
