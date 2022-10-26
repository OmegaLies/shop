# encoding: utf-8

class ProductCollection
  PRODUCT_TYPES = [
    {dir: 'films', class: Film},
    {dir: 'books', class: Book}
  ]

  attr_accessor :products

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |hash|
      Dir["#{dir_path}/#{hash[:dir]}/*.txt"].each do |path|
        products << hash[:class].from_file(path)
      end
    end

    self.new(products)
  end

  def to_a
    @products
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! { |product| product.to_s }
    when :price
      @products.sort_by! { |product| product.price }
    when :amount
      @products.sort_by! { |product| product.amount }
    end

    @products.reverse! if params[:order] == :asc
  end
end
