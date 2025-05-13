def convert_distance():
    n = input('Insert the conversion you want to make : ')
    conversions = {
        'km': 1000,
        'dm': 0.1,
        'cm': 0.01,
        'mm': 0.001,
        }
    lst = n.split()
    num = int(lst[0])
    conv = lst[-1]
    rslt = num / conversions[conv]
    return f'{num} {lst[1]} = {rslt} {conv}'

