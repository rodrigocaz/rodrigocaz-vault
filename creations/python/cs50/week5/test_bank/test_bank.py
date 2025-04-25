import pytest
from bank import value

def test_value():
    assert value('Hello bro') == 0
    assert value('Hey there') == 20
    assert value('Welcome to the crib') == 100
