def main():
    try:
        names = []
        while True:
            name = input()
            names.append(name)
    except EOFError:
        goodbye = 'Adieu, adieu, to'
        if len(names) == 1:
            print(f'{goodbye} {names[0]}')
        elif len(names) == 2:
            print(f'{goodbye} {names[0]} and {names[1]}')
        elif len(names) >= 3:
            rslt1 = ', '.join(names[0:-1])
            print(f'{goodbye} {rslt1}, and {names[-1]}')

main()
