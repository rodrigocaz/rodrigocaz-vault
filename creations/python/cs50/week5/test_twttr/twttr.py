def main():
    word = input('Input: ')
    rslt = shorten(word)
    if rslt.isalpha():
        print(f'Output: {rslt}')


def shorten(word):
    try:
        vowels = 'aeiouAEIOU'
        for char in vowels:
            word = word.replace(char,'')
        if word.isalpha() == True:
            return word
    except ValueError:
        return main()
if __name__ == "__main__":
    main()
