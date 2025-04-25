import sys
from tabulate import tabulate
import csv
def main():
    try:
        if len(sys.argv) > 2:
            sys.exit('Too many command-line arguments')
        elif len(sys.argv) < 2:
            sys.exit('Too few command-line arguments')
        elif len(sys.argv) == 2 and (sys.argv[1].split('.'))[-1] != 'csv':
            sys.exit('Not a CSV file')
        elif len(sys.argv) == 2 and (sys.argv[1].split('.'))[-1] == 'csv':
            file = sys.argv[1]
            with open(file, 'r') as file:
                rcsv = csv.DictReader(file)
                print(tabulate(rcsv, headers = 'keys',  tablefmt = 'grid'))
    except FileNotFoundError:
        sys.exit('File does not exist')
if __name__ == '__main__':
    main()
