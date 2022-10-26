# encoding: utf-8

require_relative "lib/product"
require_relative "lib/book"
require_relative "lib/film"

leon = Film.from_file('./data/films/01.txt')
puts leon

idiot = Book.from_file('./data/books/01.txt')
puts idiot

leon.price = 500
leon.amount = 5
puts leon

idiot.update(price: 1000, amount: 20)
puts idiot
