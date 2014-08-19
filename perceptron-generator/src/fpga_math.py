def discrete(c, M, n):
    return int(round(c * float((2**n)-2)/(2*M)))


def continuous(d, M, n):
    return d * float(2*M) / ((2**n)-2)
