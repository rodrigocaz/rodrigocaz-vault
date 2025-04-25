def twttr():
    iput = input('Input: ')
    vowels ='aeiouAEIOU'
    for i in vowels:
        iput = iput.replace(i,"")
    print(f'Output: {iput}')

twttr()


