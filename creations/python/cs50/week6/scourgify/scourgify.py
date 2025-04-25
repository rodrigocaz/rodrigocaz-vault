import sys
import csv
def main():
    rslt = []
    try:
       if len(sys.argv) < 3:
           sys.exit('Too few command-line arguments')
       elif len(sys.argv) > 3:
           sys.exit('Too many command-line arguments')
       elif len(sys.argv) == 3 and not sys.argv[1].endswith('csv') and not sys.argv[2].endswith('csv'):
           sys.exit('Not a CSV file')
       elif len(sys.argv) == 3 and sys.argv[1].endswith('csv') and sys.argv[2].endswith('csv'):
           file1 = sys.argv[1]
           file2 = sys.argv[2]
           with open(file1, 'r') as normal:
              reader = csv.DictReader(normal)
              for row in reader:
                  fname = row['name'].split(',')
                  rslt.append({'first':fname[1].strip(),'last':fname[0], 'house':row['house']})

           with open(file2, 'w') as changed:
               writer = csv.DictWriter(changed, fieldnames = ['first', 'last', 'house'])
               writer.writeheader()
               for row in rslt:
                   writer.writerow(
                       {
                       'first': row['first'],
                       'last': row['last'],
                       'house': row['house']
                       }
                    )
    except FileNotFoundError:
        sys.exit('File does not exist')

if __name__ == '__main__':
    main()




