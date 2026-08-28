import requests
from urllib.parse import quote
from bs4 import BeautifulSoup


def build_search_url(search_term):
    encoded_search = quote(search_term)

    search_url = (
        "https://mdcomputers.in/?route=product/search&search="
        + encoded_search
    )

    return search_url


def fetch_page(search_url):
    try:
        response = requests.get(search_url, timeout=10)
        response.raise_for_status()
        return response.text
    except requests.RequestException as error:
        print("Failed to retrieve the webpage:", error)
        return None


def extract_products(html):
    soup = BeautifulSoup(html, "html.parser")

    products = soup.find_all("div", class_="product-grid-item")

    extracted_products = []

    for product in products:
        name_element = product.find(
            "h3",
            class_="product-entities-title"
        )

        price_element = product.find("span", class_="amount")

        if name_element:
            product_name = name_element.get_text(strip=True)
        else:
            product_name = "Name unavailable"

        if price_element:
            selling_price = price_element.get_text(strip=True)
        else:
            selling_price = "Price unavailable"

        extracted_products.append((product_name, selling_price))

    return extracted_products


def main():
    search_term = input("Enter search term: ")

    search_url = build_search_url(search_term)

    print("Search URL:", search_url)

    html = fetch_page(search_url)

    if html is None:
        return

    products = extract_products(html)

    print("Number of products:", len(products))

    if not products:
        print("No products found.")
        return

    print("\nProducts found:\n")

    for number, (product_name, selling_price) in enumerate(products, start=1):
        print(f"{number}. {product_name} - {selling_price}")


if __name__ == "__main__":
    main()