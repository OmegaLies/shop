# encoding: utf-8

class Basket
  attr_accessor :products, :full_price

  def initialize(products = [], full_price = 0)
    @products = products
    @full_price = full_price
  end

  def empty?
    @products.empty?
  end

  def <<(product)
    @products << product
    @full_price += product.price
  end

  def to_s
    result = @products.tally.map { |product, amount| "#{amount}шт. - #{product}" }
    <<~BASKET
      #{result.join("\n")}
      
      К оплате #{@full_price} руб.
    BASKET
  end
end
