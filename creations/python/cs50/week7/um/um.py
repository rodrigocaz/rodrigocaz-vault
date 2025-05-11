import re

def main():
    print(count(input("Text: ")))


def count(s):
    rslt = re.findall(r'\b\W*um\W*', s, re.IGNORECASE)
    return len(rslt)


if __name__ == "__main__":
    main()
