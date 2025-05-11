import re

def main():
    print(validate(input('IPv4 Address: ')))

def validate(ip):
    pattern = r'^((25[0-5]|2[0-4]\d|1\d{2}|[1-9]?\d)\.){3}' \
              r'(25[0-5]|2[0-4]\d|1\d{2}|[1-9]?\d)$'
    match = re.fullmatch(pattern, ip)
    if match:
        return 'True'
    else:
        return 'False'


if __name__ == '__main__':
    main()
