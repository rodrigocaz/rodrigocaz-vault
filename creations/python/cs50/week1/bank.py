salute = input('Greeting: ')
def bank():
    norm_salute = salute.lower().strip()
    if 'hello' in norm_salute:
        print('$0')
    elif norm_salute[0] == 'h' and not 'hello' in norm_salute:
        print('$20')
    else:
        print('$100')

bank()
