import random
from pyfiglet import Figlet

def main():
    f = Figlet(font='slant')
    print(f.renderText('ROCK, PAPER, SCISSORS'))
    print('Welcome to rock paper scissors\n')

    options = ['rock','paper','scissors']

    cpu = random.choice(options)
    player = input('Please select rock, paper or scissors: ')
    print()

    if player not in options:
        print("I think there's been an error please try again")
    else:
        if player == 'rock' and cpu == 'scissors':
            print("You've won!")
        elif player == 'paper' and cpu == 'rock':
            print("You've won!")
        elif player == 'scissors' and cpu == 'paper':
            print("You've won!")
        elif player == cpu:
            print('Tie')    
        else:
            print("You've Lost :(")
            print(f"CPU's choice was: {cpu}")         
        

if __name__ == '__main__':
    main()