import itertools as it

# generator of even fibonacci numbers
def even_fibs():
    a, b = 0, 2
    while True:
        yield a
        a, b = b, 4 * b + a

# take all the even fibs that are less than 40 million and sum them
print(sum(it.takewhile(lambda x: x <= 40_000_000, even_fibs())))
