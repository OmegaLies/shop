# encoding: utf-8

require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/drive"
require_relative "lib/basket"
require_relative "lib/product_collection"

collection = ProductCollection.from_dir("#{__dir__}/data")
collection.sort!(by: :title, order: :asc)

puts "Приветствуем вас в магазине на кресле!"
puts "Что вы хотите приобрести?"
puts
puts collection
user_choice = STDIN.gets.to_i
puts

buy_list = Basket.new
until user_choice == 0 || collection.empty?
  collection.buy(user_choice, buy_list)

  puts "Что вы хотите приобрести?"
  puts
  puts collection
  user_choice = STDIN.gets.to_i
  puts
end

unless buy_list.empty?
  puts buy_list
else
  puts "Очень жаль, что вы ничего не выбрали. Заглядывайте еще!"
end
