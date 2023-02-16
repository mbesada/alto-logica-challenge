require_relative './product'

class ProductParser
  # TODO: could be passed on the constructor to make it more dynamic
  # Also the boxes -> box is a patch it maybe could be improved to solve the general problem with plurals
  EXCEMPT_LIST = %w[chocolate book pill].freeze
  IMPORTED_KEYWORD = 'imported'

  def initialize(taxes = {
    excempt: 0,
    default: 0.1,
    imported: 0.05
  })
    @taxes = taxes
  end

  def parse(product_string)
    splitted = product_string.split(' ')
    quantity = splitted[0].to_i
    description = splitted[1..-3].join(' ').gsub('boxes', 'box')
    price = splitted[-1].to_f

    Product.new(quantity: quantity.to_i, description: description, price: price, tax: get_tax(description))
  end

  def get_tax(description)
    tax = EXCEMPT_LIST.any? { |item| description.include?(item) } ? @taxes[:excempt] : @taxes[:default]
    tax += @taxes[:imported] if description.include?(IMPORTED_KEYWORD)
    tax
  end
end
