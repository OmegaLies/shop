# encoding: utf-8

require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"

leon = Film.new(label: "Леон", price: 290, amount: 9, director: "Люк Бессон", year: "1994")
puts leon

idiot = Book.new(label: "Идиот", price: 1500, amount: 10, author: "Федор Достоевский", genre: "роман")
puts idiot

leon.price = 500
leon.amount = 5
puts leon

idiot.update(price: 1000, amount: 20)
puts idiot
