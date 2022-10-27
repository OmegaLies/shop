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
    result = @products.map.with_index(1) { |product, index| "#{index}. #{product}" }
    <<~BASKET
      Вы купили:
      
      #{result.join("\n")}
      
      С вас #{@full_price} руб. Спасибо за покупки!
    BASKET
  end
end
