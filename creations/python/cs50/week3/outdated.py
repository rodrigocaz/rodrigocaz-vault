months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
]
def main():
    try:
        usr_date = input('Date: ')
        if '/' in usr_date:
            date1 = usr_date.split('/')
            if not (1 <= int(date1[0]) <= 12) or not (1 <= int(date1[1]) <= 31):
                return main()
            else:
                fdate1 = date1[-1::-2] + [date1[1]]
                print(f'{int(fdate1[0])}-{int(fdate1[1]):02}-{int(fdate1[2]):02}')
        elif ',' in usr_date:
            date2 = usr_date.split()
            date2[1] = date2[1].rstrip(',')

            if date2[0] not in months or not (1 <= int(date2[1]) <= 31):
                return main()
            else:
                num_month = months.index(date2[0]) + 1
                print(f'{int(date2[2])}-{int(num_month):02}-{int(date2[1]):02}')
        else:
            return main()

    except ValueError:
        return main()


main()

