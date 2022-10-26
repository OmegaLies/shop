# encoding: utf-8

class Book < Product
  attr_accessor :title, :genre, :author
  def initialize(params)
    super
    @label = params[:label]
    @author = params[:author]
    @genre = params[:genre]
  end

  def to_s
    "Книга '#{@label}', #{@genre}, автор #{@author}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end
