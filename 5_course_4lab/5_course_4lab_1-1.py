import random
# квази ньютоновский метод


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
    global xk_plus_1
    xk_plus_1 = xk - (f_dot_x(xk_eps, xk, eps)) / \
        (f_2dot_x(xk_2eps, xk_eps, xk, eps))
    return xk_plus_1


xk = random.randint(-20, 20)
print(f'xk = {xk}')
eps = 0.0001
xk_eps = xk + eps
xk_2eps = xk + 2 * eps
count_step = 0
condition = abs(func_xk_plus_1(xk_2eps, xk_eps, xk, eps) - f_x(xk))
print('f_x = ', f_x(xk))
# print('func_xk_plus_1 = ', func_xk_plus_1(xk_2eps, xk_eps, xk, eps))
# print('3-func_xk_plus_1 = ', 3-func_xk_plus_1(xk_2eps, xk_eps, xk, eps))
# print('eps+func_xk_plus_1 = ', eps+func_xk_plus_1(xk_2eps, xk_eps, xk, eps))
# print('condition_start = ', condition, 'eps = ', eps)


while condition >= eps:
    count_step += 1
    func_xk_plus_1(xk_2eps, xk_eps, xk, eps)
    xk = func_xk_plus_1(xk_2eps, xk_eps, xk, eps)
    print(f'xk_plus_1 = {xk_plus_1}')
    # if func_xk_plus_1(xk_2eps, xk_eps, xk, eps) >= eps:
    #xk = func_xk_plus_1(xk_2eps, xk_eps, xk, eps)
    #print(3-func_xk_plus_1(xk_2eps, xk_eps, xk, eps))

    # добавь условие вайл (фотка с телефона) и внутрь всё что выше
print(f'count steps: {count_step}')
