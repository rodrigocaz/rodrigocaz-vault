import sys
def main():
    try:
        if len(sys.argv) > 2:
            sys.exit('Too many command-line arguments')
        elif len(sys.argv) < 2:
            sys.exit('Too few command-line arguments')
        elif len(sys.argv) == 2 and (sys.argv[1].split('.'))[-1] != 'py':
            sys.exit('Not a Python file')
        elif len(sys.argv) == 2 and (sys.argv[1].split('.'))[-1] == 'py':
            file = sys.argv[1]
            with open(file, 'r') as f:
                lines = f.readlines()
            valid_lines = 0
            for line in lines:
                n_lines = line.strip()
                if n_lines == '':
                    continue
                if n_lines.startswith('#'):
                    continue
                valid_lines += 1
            print(valid_lines)
    except FileNotFoundError:
        sys.exit('File does not exist')

if __name__ == '__main__':
    main()







