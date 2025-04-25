def main():
    fraction = input('Fraction: ')
    try:
        d1 = fraction.split('/')[0]
        d2 = fraction.split('/')[-1]
        div = round((int(d1) / int(d2)) * 100)
        if 95 <= div <= 100:
            print('F')
        elif 0 <= div <= 5:
            print('E')
        elif div > 100:
            return main()
        else:
            print(f'{div}%')
    except ValueError:
        return main()
    except ZeroDivisionError:
        return main()

main()
