# encoding: utf-8

class Basket
  attr_accessor :products

  def initialize(products = [])
    @products = products
  end

  def empty?
    @products.empty?
  end

  def <<(product)
    @products << product
  end

  def full_price
    @products.tally.map { |product, amount| amount * product.price }.sum
  end

  def to_s
    result = @products.tally.map { |product, amount| "#{amount}шт. - #{product}" }
    <<~BASKET
      #{result.join("\n")}
      
      К оплате #{full_price} руб.
    BASKET
  end
end
