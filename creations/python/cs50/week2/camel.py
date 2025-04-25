def camel():
    words = input('camelCase: ')
    wordss = ''
    for char in words:
        if char.isupper():
            wordss += '_' + char.lower()
        else:
            wordss += char
    print(f'snake_case: {wordss.lstrip('_')}')

camel()

