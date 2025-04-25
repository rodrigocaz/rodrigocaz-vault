def main():
    try:
        list = {}
        while True:
            thing = input().strip()
            uthing = thing.upper()
            if uthing not in list:
                list[uthing] = 1
            else:
                list[uthing] += 1
    except EOFError:
        for key, value in sorted(list.items()):
            print(f'{value} {key}')
main()
