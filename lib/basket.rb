# encoding: utf-8

class Basket
  attr_accessor :products, :full_price

  def initialize(products = {}, full_price = 0)
    @products = products
    @full_price = full_price
  end

  def empty?
    @products.empty?
  end

  def <<(product)
    if @products.include?(product)
      @products[product] += 1
    else
      @products[product] = 1
    end
    @full_price += product.price
  end

  def to_s
    result = @products.map { |product| "#{product[1]}шт. - #{product[0]}" }
    <<~BASKET
      #{result.join("\n")}
      
      К оплате #{@full_price} руб.
    BASKET
  end
end
