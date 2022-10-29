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
  check_result = collection.check_choice(user_choice, buy_list)
  if user_choice != 0 && check_result == 0
    puts "Неверный номер, попробуйте еще раз."
  elsif check_result == 2
    puts "Сейчас в корзине:"
    puts
    puts buy_list
    puts
  end
end

unless buy_list.empty?
  puts "Вы купили:"
  puts
  puts buy_list
  puts "Спасибо за покупки!"
else
  puts "Очень жаль, что вы ничего не выбрали. Заглядывайте еще!"
end
