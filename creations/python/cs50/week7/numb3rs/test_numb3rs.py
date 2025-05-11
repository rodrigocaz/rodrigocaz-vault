import pytest
from numb3rs import validate

def main():
    test_validate()

def test_validate():
    assert validate('255.255.255.255') == 'True'
    assert validate('512.512.512.512') == 'False'
    assert validate('1.2.3.1000') != 'False'
    assert validate('cat') == 'False'


if __name__ == '__main__':
    main()
