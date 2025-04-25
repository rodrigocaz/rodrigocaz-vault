def main():
    time = input('What time is it? ')
    time2 = convert(time)
    if time2 >= 7.0 and time2 <= 8.0:
        print('breakfast time')
    elif time2 >= 12.0 and time2 <= 13.0:
        print('lunch time')
    elif time2 >= 18.0 and time2 <= 19.0:
        print('dinner time')

def convert(time):
    hour = time.split(':')[0].strip()
    minutes = time.split(':')[-1].strip()
    return float(hour) + (float(minutes) / 60)

if __name__ == "__main__":
    main()
