import re
import sys


def main():
    print(parse(input("HTML: ")))


def parse(s):
    pattern = r'(?:https?://)?(?:www\.)?(?:youtube\.com/(?:watch\?v=|embed/)|youtu\.be/)([\w-]{11})'

    match = re.search(pattern, s)
    if match:
        return f'https://youtu.be/{match.group(1)}'
    else:
        return None


if __name__ == "__main__":
    main()
