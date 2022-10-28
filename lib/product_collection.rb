# encoding: utf-8

class ProductCollection
  PRODUCT_TYPES = [
    {dir: 'films', class: Film},
    {dir: 'books', class: Book},
    {dir: 'drives', class: Disc}
  ]

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

  def to_s
    result = @products.map.with_index(1) { |product, index| "#{index}. #{product}" }
    <<~RESULT
      #{result.join("\n")}
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

  def buy(choice, basket)
    if (1..@products.length).include?(choice)
      basket << @products[choice - 1]
      unless (@products[choice - 1]).amount == 1
        (@products[choice - 1]).amount -= 1
      else
        (@products[choice - 1]).amount = 0
        @products.delete_at(choice - 1)
      end
      return nil
    end
    0
  end
end
