# encoding: utf-8

class Product
  attr_accessor :price, :amount

  def self.from_file(file_path)
    raise NotImplementedError
  end

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
  end

  def to_s
    "#{@price} руб."
  end

  def full_info
    "#{@price} руб. (осталось #{@amount})"
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end
end
