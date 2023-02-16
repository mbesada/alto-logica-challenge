# alto-logica-challenge
Receipt builder challenge

# Ruby version: 2.7.6 (The one I had installed)
## Usage: 

From the command line you can run `ruby src/main PATH_TO_FILE` where the file is a txt with one line per product (no first line as title)

The method `ReceiptBuilder.build_receipt(products)` will return an string with the expected output.
The input is an array of strings with one line per item, as an example:

```
    ReceiptBuilder.build_receipt(['1 imported box of chocolates at 10.00','1 imported bottle of perfume at 47.50'])
```

Will generate:

```
    1 imported box of chocolates: 10.50
    1 imported bottle of perfume: 54.65
    Sales Taxes: 7.65
    Total: 65.15
```

## Tests:

The test are made using RSpec, you can test it by runnint rspec from the command line (after bundle install)

## Todos:

There are some more test needed on the `Product`class, also fix some rubocop warnings.
Also there are some code duplication (on the sprintf as an example) that can be avoided.
Create a better CLI
Error handling for parsing issues