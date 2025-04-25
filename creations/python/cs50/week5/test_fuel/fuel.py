def main():
    fraction = input('Fraction: ')
    percentage = convert(fraction)
    print(gauge(percentage))

def convert(fraction):
    while True:
        try:
            a, b = fraction.split('/')
            a = int(a)
            b = int(b)
            f = a / b
            if f <= 1:
                p = int(f * 100)
                return p
            else:
                fraction = input('Fraction')
                pass
        except(ZeroDivisionError,ValueError):
            raise


def gauge(percentage):
    if percentage >= 99:
        return 'F'
    elif percentage <= 1:
        return 'E'
    else:
        return f'{percentage}%'


if __name__ == "__main__":
    main()
