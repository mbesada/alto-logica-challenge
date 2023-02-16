require_relative './product_parser'
# Basic sales tax is applicable at a rate of 10% on all goods,
#  books, food, and medical products that are exempt.
#  Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

class ReceiptBuilder
  def initialize(product_parser = ProductParser.new)
    @parser = product_parser
  end

  def build_receipts(product_descriptions)
    products = product_descriptions.map { |description| @parser.parse(description) }
    receipt_lines(products)
  end

  # Takes an array of items
  def self.build_receipt(product_descriptions)
    result = new.build_receipts(product_descriptions)
    result.join("\n")
  end

  def self.build_from_file(filename)
    products = []
    File.foreach(filename) do |line|
      products << line.chomp
    end
    build_receipt(products)
  end

  private

  def receipt_lines(products)
    items_description = products.map(&:to_s)
    items_description << sales_taxes(products) << sales_total(products)
  end

  def sales_taxes(products)
    amount = products.reduce(0) do |total, product|
      total + product.tax_amount
    end
    "Sales Taxes: #{format('%.2f', amount)}"
  end

  def sales_total(products)
    amount = products.reduce(0) do |total, product|
      total + product.end_price
    end
    "Total: #{format('%.2f', amount)}"
  end

  
end
