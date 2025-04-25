import sys
import requests
def main():
    if len(sys.argv) != 2:
        sys.exit('Missing command-line argument')
    try:
        amount = float(sys.argv[1])
    except ValueError:
        sys.exit('Command-line argument is not a number')
    url = "https://rest.coincap.io/v3/assets/bitcoin?apiKey=7f449d4fb326af98c8378a9fa7c10d5abfb08de38be37b0b9b1fe5c51080581e"
    response = requests.get(url)
    response.raise_for_status()
    data = response.json()
    price = float(data['data']['priceUsd'])
    total = amount * price
    print(f"${total:,.4f}")

main()

