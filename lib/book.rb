# encoding: utf-8

class Book < Product
  attr_reader :title, :genre, :author
  def initialize(params)
    super
    @label = params[:label]
    @author = params[:author]
    @genre = params[:genre]
  end

  def to_s
    "Книга '#{@label}', #{@genre}, автор #{@author}, #{super}"
  end
end
