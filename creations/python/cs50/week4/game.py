import random
def main():
    level = 'a'
    while not level.isnumeric() or level == '0':
        level = input('Level: ')
    ntg = random.randint(1, int(level))
    gn = 'a'
    while True:
        while not gn.isnumeric():
            gn = input('Guess: ')
        ign = int(gn)
        if ign < ntg:
            print('Too small!')
            gn = 'a'
        elif ign > ntg:
            print('Too large!')
            gn = 'a'
        elif ign == ntg:
            print('Just right!')
            break
main()
