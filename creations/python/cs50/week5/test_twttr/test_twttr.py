import pytest
from twttr import shorten

def test_shorten():
    assert shorten('twitter') == 'twttr'
    assert shorten('rodrigo') == 'rdrg'
    assert shorten('Alexander') == 'lxndr'
    assert shorten('hi, my number is 2001') == 'h, my nmbr s 2001'
