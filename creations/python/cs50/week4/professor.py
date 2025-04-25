import random
def main():
    level = get_level()
    score = 0
    tries = 0
    for _ in range(10):
        x = generate_integer(level)
        y = generate_integer(level)
        ca = x + y
        correct = False
        for _ in range(3):
            try:
                q = int(input(f'{x} + {y} = '))
                if q == ca:
                    score += 1
                    correct = True
                    break
                else:
                    print('EEE')
            except ValueError:
                print('EEE')
        if not correct:
            print(f'Correct Answer: {ca}')
    print(f'Score: {score}/10')

def get_level():
    while True:
        try:
            level = int(input('Level: '))
            if level in [1,2,3]:
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
