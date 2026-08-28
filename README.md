# Technical Assignment – Full Stack Engineering

This repository contains solutions for the Affinity Answers Full Stack Engineering technical assignment using Python, SQL, and Unix/Linux shell scripting.

## Overview

The assignment consists of three technical tasks:

1. Python web scraping
2. SQL and database querying
3. Unix/Linux shell scripting

The solutions focus on readable code, basic error handling, and simple implementation.

## Project Structure

```text
technical-assignment/
├── README.md
├── question1/
│   └── scraper.py
├── question2/
│   └── queries.sql
└── question3/
    └── companies.sh
Prerequisites
Question 1 – Python Web Scraping

Requirements:

Python 3
Requests
BeautifulSoup4

Install the required Python packages:

pip install requests beautifulsoup4
Question 2 – SQL and Database

Requirements:

MySQL Shell or MySQL client
Internet connection
Access to the Rfam public MySQL database

Rfam database documentation:

https://docs.rfam.org/en/latest/database.html

Question 3 – Unix/Linux Shell Scripting

Requirements:

Bash shell
Git Bash, Linux, or WSL
curl
awk
sort
Question 1 – Python Web Scraping
Description

The Python program accepts a search term from the user and dynamically constructs a search URL for the MDComputers website.

It retrieves the search-results webpage, parses the HTML using BeautifulSoup, and extracts:

Product name
Selling price

The program also includes basic handling for request failures and cases where no products are found.

Website

MDComputers:

https://mdcomputers.in/

Example search URL:

https://mdcomputers.in/?route=product/search&search=external%20harddrive

How to Run

Navigate to the Question 1 directory:

cd question1

Run the program:

python scraper.py

Enter a search term when prompted.

Example:

Enter search term: external hard drive

The program displays the products found and their selling prices.

Dependencies
requests
beautifulsoup4
Question 2 – SQL and Database
Description

The SQL queries use the public Rfam MySQL database.

The queries.sql file contains queries for:

Counting Acacia entries in the taxonomy table.
Finding the wheat type with the longest DNA sequence.
Finding families with a maximum DNA sequence length greater than 1,000,000 and returning page 9 of the sorted results.
Rfam Database

Documentation:

https://docs.rfam.org/en/latest/database.html

The queries use tables including:

taxonomy
rfamseq
family
full_region
SQL File

All SQL queries are available in:

question2/queries.sql

The queries were tested against the Rfam public MySQL database.

Question 3 – Unix Shell Scripting
Description

The shell script accepts the S&P 500 companies CSV dataset URL as a command-line argument.

It:

Downloads the CSV data.
Extracts the company name, headquarters location, and founding year.
Handles founding-year values containing additional text.
Sorts the records by founding year.
Displays the processed information in a readable format.

The script also handles a missing URL argument and a failed dataset download.

Dataset

The script is designed to process the supplied S&P 500 dataset:

https://raw.githubusercontent.com/datasets/s-and-p-500-companies/refs/heads/main/data/constituents.csv

How to Run

Navigate to the Question 3 directory:

cd question3

Run the script:

./companies.sh "https://raw.githubusercontent.com/datasets/s-and-p-500-companies/refs/heads/main/data/constituents.csv"

Example output:

Company | Location | Founding Year
BNY Mellon | New York City, New York | 1784
State Street Corporation | Boston, Massachusetts | 1792
Colgate-Palmolive | New York City, New York | 1806
Error Handling

If the URL argument is not provided, the script displays a usage message.

If the dataset cannot be retrieved, the script displays an error message and exits.

Assumptions and Limitations
The Python scraper depends on the current HTML structure of the MDComputers website.
Changes to the website structure may require updates to the HTML selectors used by the scraper.
The SQL queries depend on the current schema and data available in the public Rfam database.
The shell script expects the CSV format and column structure of the supplied S&P 500 dataset.
The shell script should be run in a Bash-compatible environment such as Git Bash, Linux, or WSL.