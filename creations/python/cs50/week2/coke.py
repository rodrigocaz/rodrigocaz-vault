def coke ():
    i = 0
    while i < 50:
        m = int(input('Insert Coin: '))
        if m == 25 or m == 10 or m == 5:
            i += m
            if i < 50:
                print(f'Amount Due: {50 - i}')
            else:
                print(f'Change Owed: {i - 50}')
        else:
            print(f'Amount Due: {50}')

coke()
