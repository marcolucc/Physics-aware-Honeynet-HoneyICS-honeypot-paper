import requests
from bs4 import BeautifulSoup

# Define the URL of the webpage to scrape
url = "http://45.25.122.205/"

# Send a request to the webpage and get its HTML content
response = requests.get(url)
#print(response.status_code)
html_content = response.content
#print(html_content)

# Use BeautifulSoup to parse the HTML content and find all the links
soup = BeautifulSoup(html_content, "html.parser")
links = soup.find_all("frame")


# Loop through the links and print their href attributes
for link in links:
    print(link.get("src"))

for link in links:
    lev2= url+link.get("src")
    print(lev2)
    responselev2 = requests.get(lev2)
    print(responselev2.status_code)
    html_contentlev2 = responselev2.content
    print(html_content)

    # Use BeautifulSoup to parse the HTML content and find all the links
    soup = BeautifulSoup(html_contentlev2, "html.parser")
    linkslev2 = soup.find_all("frame")
    for linklev2 in linkslev2:
        print(linklev2.get("src"))