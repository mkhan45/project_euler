def divis(a: int, b: int) -> bool:
    return a % b == 0

def isprime(n: int) -> bool:
   return n == 2 or n == 3 or (n % 2 != 0 and n % 3 != 0 and n % 5 != 0 and\
         all(n % i != 0 and n % (i + 2) != 0 for i in range(5, int(n**0.5), 6)))

def wheel_factor(n: int) -> int:
    if isprime(n): return n

    inc = [4, 2, 4, 2, 4, 6, 2, 6]

    for prime in [2, 3, 5, 7, 11]:
        if divis(n, prime):
            return prime

    test = False

    k, i = 7, 0
    while not test and k * k <= n:
        test = divis(n, k)
        if test: return k
        k += inc[i]
        i = i + 1 if i < 7 else 0
    return n

n = 600851475143
print(n // wheel_factor(n))
