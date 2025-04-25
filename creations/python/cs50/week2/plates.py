def main():
    plate = input("Plate: ")
    if is_valid(plate):
        print("Valid")
    else:
        print("Invalid")


def is_valid(plate):
    if not 2 <= len(plate) <= 6:
        return False
    if not plate[:2].isalpha():
        return False
    if not plate.isalnum():
        return False
    num_started = False
    for i, char in enumerate(plate):
        if char.isdigit():
            if not num_started and char == '0':
                return False
            num_started = True
        elif num_started:
            return False
    return True

main()
