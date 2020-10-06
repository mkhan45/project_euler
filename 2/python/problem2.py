import itertools as it

def even_fibs():
    a, b = 0, 2
    while True:
        yield a
        a, b = b, 4 * b + a

print(sum(it.takewhile(lambda x: x <= 40_000_000, even_fibs())))
