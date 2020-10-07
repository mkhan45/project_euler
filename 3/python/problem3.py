def wheel_factor(n: int) -> int:
    inc = [4, 2, 4, 2, 4, 6, 2, 6]

    for prime in [2, 3, 5, 7, 11]:
        if n % prime == 0:
            return prime

    test = False

    k, i = 7, 0
    while not test and k * k <= n:
        test = n % k == 0
        if test: return k
        k += inc[i]
        i = i + 1 if i < 7 else 0
    return n

n = 600851475143
print(n // wheel_factor(n))
