import pytest
from plates import is_valid

def test_is_valid():
    assert is_valid('CS50') == True
    assert is_valid('AB123') == True
    assert is_valid('XY9') == True
    assert is_valid('ROAD66') == True
    assert is_valid('R') == False
    assert is_valid('RODR1OO') == False
    assert is_valid('Hel!0') == False
    assert is_valid('AB12C3') == False
    assert is_valid('HEL012') == False
    assert is_valid('12ELL0') == False
    assert is_valid('CS50!') == False
    assert is_valid('1ACRHE') == False
    assert is_valid('2BHJLK') == False
    assert is_valid('123BCA') == False
