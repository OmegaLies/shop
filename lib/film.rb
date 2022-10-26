# encoding: utf-8

class Film < Product
  attr_accessor :title, :year, :director

  def initialize(params)
    super
    @label = params[:label]
    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    "Фильм '#{@label}', #{@year}, реж. #{@director}, #{super}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @director = params[:director] if params[:director]
  end
end
