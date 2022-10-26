# encoding: utf-8

require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"

leon = Film.new(label: "Леон", price: 290, amount: 9)
puts "Фильм #{leon.label} стоит #{leon.price} руб."
