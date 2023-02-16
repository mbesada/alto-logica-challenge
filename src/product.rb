# TODO: For a matter of time ended up testing this class on the product_parser spec instead
# of here. With more time (and more relaxed) this test needs to be done.

class Product
  attr_accessor :price, :tax, :description, :quantity

  def initialize(args = {})
    @price = args[:price] || 0
    @tax = args[:tax] || 0
    @description = args[:description] || ''
    @quantity = args[:quantity]
  end

  def end_price
    (price * quantity + tax_amount).round(2)
  end

  def tax_amount
    amount = (price * tax).round(2)
    ((amount * 20).ceil / 20.0) * quantity
  end

  def to_s
    "#{quantity} #{description}: #{format('%.2f', end_price)}"
  end
end
