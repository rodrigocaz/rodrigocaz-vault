from pyfiglet import Figlet
import random

f = Figlet(font='slant')
print(f.renderText('PASSWORD GENERATOR'))

def main():
    lenpass = int(input('Please put in the length of your password: '))
    chars ='qwertyuiopasdfghjklñzxcvbnmQWERTYUIOPASDFGHJKLÑZXCVBNM1234567890.-_!'
    password = ''

    for char in range(lenpass):
        password += random.choice(chars)

    print(f'Your new password is {password}')

if __name__ == '__main__':
    main()