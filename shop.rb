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
  if (1..collection.size).include?(user_choice)
    product = collection[user_choice - 1]
    buy_list << product
    if product.amount == 1
      product.amount = 0
      collection.delete(product)
    else
      product.amount -= 1
    end
  elsif user_choice == collection.size + 1
    puts "Сейчас в корзине:"
    puts
    puts buy_list
    puts
  else
    puts "Неверный номер, попробуйте еще раз."
  end
end

if buy_list.empty?
  puts "Очень жаль, что вы ничего не выбрали. Заглядывайте еще!"
else
  puts "Вы купили:"
  puts
  puts buy_list
  puts "Спасибо за покупки!"
end
