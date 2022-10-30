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
  if (1..collection.length).include?(user_choice)
    buy_list << collection[user_choice - 1]
    if (collection[user_choice - 1]).amount == 1
      (collection[user_choice - 1]).amount = 0
      collection.delete_at(user_choice - 1)
    else
      (collection[user_choice - 1]).amount -= 1
    end
  elsif user_choice == collection.length + 1
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
