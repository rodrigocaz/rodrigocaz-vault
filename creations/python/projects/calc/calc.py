import math
from pyfiglet import Figlet
def sum(x, y):
    return x + y

def sub(x, y):
    return x - y

def mult(x, y):
    return x * y

def div(x, y):
    return x / y

def mult(x, y):
    return x * y

def mod(x, y):
    return x % y

def pow(x, y):
    return x ** y

def sqrt(x):
    return math.sqrt(x)

def factorial(x):
    return math.factorial(x)

def absolute(x):
    return math.fabs(x)

def natural_log(x):
    return math.log(x)

def log_base10(x):
    return math.log10(x)

def sin(x):
    return math.sin(x)

def cos(x):
    return math.cos(x)

def tan(x):
    return math.tan(x)

def rad_to_grad(x):
    return x * (180 / math.pi)

def main():
    f = Figlet(font = 'slant')
    print(f.renderText('calc'))
    print('1. Basic Math')
    print('2. Intermediate Math')
    print('3. Trigonometry')
    print('4. Exit Calc')

    try:
        while True:
            choice = int(input('Choose which type of math you want to work with: '))

            if choice == 4:
                print('Happy Coding, have a nice day')
                break
            elif choice not in [1,2,3]:
                print('Please Insert one of the available options')
                continue
            if choice == 1:
                x = int(input('Input your first number: '))
                y = int(input('Input your second number: '))
                print('1. Sum')
                print('2. Sub')
                print('3. Multiply')
                print('4. Divide')
                print('5. Exponientation') # Exponiention is not basic math but this is the section in which were only going to work with two numbers
                print('6. Module')
                sub_choice = int(input('Choose what operation you want to work with: '))
                if sub_choice == 1:
                    print(f'{x} + {y} = {sum(x, y)}')
                elif sub_choice == 2:
                    print(f'{x} - {y} = {sub(x, y)}')
                elif sub_choice == 3:
                    print(f'{x} * {y} = {mult(x, y)}')
                elif sub_choice == 4:
                    print(f'{x} / {y} = {div(x, y)}')
                elif sub_choice == 5:
                    print(f'{x}**{y} = {pow(x, y)}')
                elif sub_choice == 6:
                    print(f'{x} % {y} = {mod(x, y)}')        
            elif choice == 2:
                x = int(input('Input your number: '))
                print('1. Square Root')
                print('2. Factorial')
                print('3. Absolute Value')
                sub_choice = int(input('Choose what operation you want to work with: '))
                if sub_choice == 1:
                    print(f'Square root of {x} = {sqrt(x)}')
                elif sub_choice == 2:
                    print(f'{x}! = {factorial(x)}')
                elif sub_choice == 3:
                    print(f'The absolute value of {x} = {absolute(x)}')
            elif choice == 3:
                x = int(input('Input your number: '))
                print('1. Natural log')
                print('2. Log Base 10 ')
                print('3. Sine')
                print('4. Cosine')
                print('5. Tangent')
                print('6. Radians to Degrees')
                sub_choice = int(input('Choose what operation you want to work with: '))
                
                if sub_choice == 1:
                    print(f'ln {x} = {natural_log(x)}')
                elif sub_choice == 2:
                    print(f'log10 {x} = {log_base10(x)}')
                elif sub_choice == 3:
                    print(f'sin {x} = {sin(x)} rad')
                elif sub_choice == 4:
                    print(f'cos {x} = {cos(x)} rad')
                elif sub_choice == 5:
                    print(f'tan {x} = {tan(x)} rad')
                elif sub_choice == 6:
                    print(f'{x} rad = {rad_to_grad(x)}°')
    except ValueError:
        print('An Error Has Ocurred, Please Try Again')
        return main()
    except ZeroDivisionError:
        print('You divided by 0, please try again')
        return main()


if __name__ == '__main__':
    main()                   
