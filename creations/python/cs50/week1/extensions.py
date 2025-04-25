def extensions():
    file1 = input('File name: ')
    if '.' in file1:
        extension = file1.split('.')[-1].lower().strip()
        if extension == 'jpg' or extension == 'jpeg':
            print('image/jpeg')
        elif extension == 'png' or extension == 'gif':
            print(f'image/{extension}')
        elif extension == 'pdf' or extension == 'zip':
            print(f'application/{extension}')
        elif extension == 'txt':
            print('text/plain')
        else:
            print('application/octet-stream')
    else:
        print('application/octet-stream')

extensions()
