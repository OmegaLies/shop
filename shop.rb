# encoding: utf-8

require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/disc"
require_relative "lib/basket"
require_relative "lib/product_collection"

collection = ProductCollection.from_dir("#{__dir__}/data")
collection.sort!(by: :title, order: :asc)

puts "Приветствуем вас в магазине на кресле!"

user_choice = -1
buy_list = Basket.new
until user_choice == 0 || collection.empty?
  puts "Что вы хотите приобрести?"
  puts
  puts collection
  user_choice = STDIN.gets.to_i
  puts
  if user_choice != 0 && collection.buy(user_choice, buy_list) != nil
    puts "Неверный номер, попробуйте еще раз."
  end
end

unless buy_list.empty?
  puts buy_list
else
  puts "Очень жаль, что вы ничего не выбрали. Заглядывайте еще!"
end
