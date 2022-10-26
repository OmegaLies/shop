# encoding: utf-8

class ProductCollection
  PRODUCT_TYPES = [
    {dir: 'films', class: Film},
    {dir: 'books', class: Book},
    {dir: 'drives', class: Drive}
  ]

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

  def empty?
    @products.empty?
  end

  def to_s
    result = @products.map.with_index(1) { |product, index| "#{index}. #{product.to_s}" }
    <<HEREDOC
#{result.join("\n")}
0. Выход
HEREDOC
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

  def buy(choice)
    result = [@products[choice - 1], (@products[choice - 1]).price]
    unless (@products[choice - 1]).amount == 1
      (@products[choice - 1]).amount -= 1
    else
      (@products[choice - 1]).amount = 0
      @products.delete_at(choice - 1)
    end
    result
  end
end
