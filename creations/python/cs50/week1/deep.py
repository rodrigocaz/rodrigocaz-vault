thought = input('What is the Answer to the Great Question of Life, the Universe, and Everything? ')
def deep():
    norm_thought = thought.lower().strip()
    if norm_thought == '42':
        print('Yes')
    if norm_thought == 'forty-two' or norm_thought == 'forty two':
        print('Yes')
    else:
        print('No')

deep()
