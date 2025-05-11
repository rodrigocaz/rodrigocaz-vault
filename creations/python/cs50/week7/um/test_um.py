from um import count

def main():
    test_upp_low()
    test_umword()
    test_covered()

def test_upp_low():
    assert count('Um, thanks for the album') == 1
    assert count('Um, thanks, um...') == 2

def test_umword():
    assert count('yummi') == 0

def test_covered():
    assert count('Wassup um hello') == 1
    assert count('um?') == 1

if __name__ == '__main__':
    main()

