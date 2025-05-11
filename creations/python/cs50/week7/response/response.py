from validator_collection import validators, checkers
def main():
    e_adress = input('Whats your email adress')

    if checkers.is_email(e_adress):
        print('Valid')
    else:
        print('Invalid')

if __name__ == '__main__':
    main()

