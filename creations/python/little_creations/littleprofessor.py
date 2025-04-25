import random
def main():
    level = get_level()
    score = 0
    for _ in range(10):
        x = generate_integer(level)
        y = generate_integer(level)
        ans = x + y
        correct = False
        for _ in range(3):
            try:
                q = int(input(f'{x} + {y} = '))
                if q == ans:
                    score += 1
                    correct = True
                    break
                else:
                    print('EEE')
            except ValueError:
                print('EEE')
        if not correct:
            print(f'Answer = {ans}')
    print(f'Score {score}/10')                     


def get_level():
    try:
        level = int(input('Level: '))
        return level
    except ValueError:
        pass


def generate_integer(level):
    if level == 1:
        return random.randint(0,9)
    elif level == 2:
        return random.randint(10,99)
    elif level == 3:
        return random.randint(100,999)        

if __name__ == "__main__":
    main()
