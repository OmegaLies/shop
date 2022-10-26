# encoding: utf-8

class Film < Product
  attr_reader :title, :year, :director

  def initialize(params)
    super
    @label = params[:label]
    @director = params[:director]
    @year = params[:year]
  end

  def to_s
    "Фильм '#{@label}', #{@year}, реж. #{@director}, #{super}"
  end
end
