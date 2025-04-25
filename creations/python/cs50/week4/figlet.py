import sys
from pyfiglet import Figlet
import random
def main():
    figlet = Figlet()
    font_list = figlet.getFonts()
    if len(sys.argv) == 1:
        word = input('Input: ')
        rfont = random.choice(font_list)
        figlet.setFont(font=rfont)  # Corrected this line
        print(figlet.renderText(word))
    elif len(sys.argv) == 2:
        sys.exit('Invalid usage')
    elif len(sys.argv) == 3:
        command = sys.argv[1]
        f1 = sys.argv[2]
        if (command == '-f' or command == '--font') and (f1 in font_list):
            word = input('Input: ')
            figlet.setFont(font = f1)
            print(figlet.renderText(word))
        else:
            sys.exit('Invalid Usage')

main()
