class Product
  attr_reader :label, :price, :amount

  def initialize(params)
    @label = params[:label]
    @price = params[:price]
    @amount = params[:amount]
  end
end
