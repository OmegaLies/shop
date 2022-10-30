# encoding: utf-8

class ProductCollection
  PRODUCT_TYPES = [
    {dir: 'films', class: Film},
    {dir: 'books', class: Book},
    {dir: 'drives', class: Disc}
  ]

  attr_accessor :products

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |hash|
      Dir["#{dir_path}/#{hash[:dir]}/*.txt"].each do |path|
        products << hash[:class].from_file(path)
      end
    end

    new(products)
  end

  def initialize(products = [])
    @products = products
  end

  def empty?
    @products.empty?
  end

  def length
    @products.length
  end

  def [](index)
    @products[index]
  end

  def to_s
    result = @products.map.with_index(1) { |product, index| "#{index}. #{product.full_info}" }
    <<~RESULT
      #{result.join("\n")}
      #{@products.length + 1}. Список покупок
      0. Выход
    RESULT
  end

  def sort!(params)
    case params[:by]
    when :title then @products.sort_by!(&:to_s)
    when :price then @products.sort_by!(&:price)
    when :amount then @products.sort_by!(&:amount)
    end

    @products.reverse! if params[:order] == :asc
  end
end
