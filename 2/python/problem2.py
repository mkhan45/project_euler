import itertools as it

def even_fibs():
    a, b = 2, 2
    while True:
        yield b
        a, b = b, 4 * a + b

print(sum(it.takewhile(lambda x: x <= 40_000_000, even_fibs())))
