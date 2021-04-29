def collatify(n: int) -> int:
    if n % 2 == 0: return n / 2
    else: return 3*n + 1

def countCollatz(n: int) -> int:
    if n == 1: return 1
    else: return 1 + countCollatz(collatify(n))

def countCollatzIter(n: int) -> int:
    iter_counts: int = 1
    while n != 1:
        iter_counts += 1
        n = collatify(n)

    return iter_counts

print(countCollatz(13))
print(countCollatzIter(13))
print(max(map(countCollatzIter, range(1, 1_000_000))))
