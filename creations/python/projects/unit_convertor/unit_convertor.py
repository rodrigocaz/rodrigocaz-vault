from pyfiglet import Figlet
import csv
from tabulate import tabulate

def main():
    f = Figlet(font='slant')
    print(f.renderText('UNIT CONVERTOR\n'))
    print('For the unit convertor we will be using the International System of units\n ')
    with open ('si.csv', 'r') as file:
        rscv = csv.DictReader(file)
        print(tabulate(rscv, headers = 'keys', tablefmt= 'grid'))
    print()
    print('-------FORMAT-------')
    print('10 m to cm')
    print('--------------------\n')
    print('-------OPTIONS--------')
    print('1. Length')
    print('2. Time')
    print('3. Mass')
    print('4. Temperature')    

if __name__ == '__main__':
    main()