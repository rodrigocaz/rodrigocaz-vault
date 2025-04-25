from PIL import Image
from PIL import ImageOps
import sys
import os

def main():
    try:
        if len(sys.argv) > 3:
            sys.exit('Too many command-line arguments')
        elif len(sys.argv) < 3:
            sys.exit('Too few command-line arguments')
        elif len(sys.argv) == 3 and ((sys.argv[2].split('.')[-1] != 'jpg') and (sys.argv[2].split('.')[-1] != 'png')):
            sys.exit('Invalid output')
        elif len(sys.argv) == 3 and ((sys.argv[2].split('.')[-1] == 'jpg') or (sys.argv[2].split('.')[-1] == 'png')):
            if os.path.splitext(sys.argv[1])[-1] != os.path.splitext(sys.argv[2])[-1]:
                sys.exit('Input and output have different extensions')
            else:
                shirt = Image.open('shirt.png')
                photo = Image.open(sys.argv[1])
                shirt.size
                photo = ImageOps.fit(photo, shirt.size)
                photo.paste(shirt, shirt)
                photo.save(sys.argv[2])
    except FileNotFoundError:
        sys.exit('Input does not exist')

if __name__ == '__main__':
    main()

