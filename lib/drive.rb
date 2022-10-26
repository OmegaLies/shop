# encoding: utf-8

class Drive < Product
  attr_accessor :title, :genre, :author
  def initialize(params)
    super
    @title = params[:title]
    @author = params[:author]
    @genre = params[:genre]
    @year = params[:year]
  end

  def to_s
    "Альбом #{@author} - '#{@title}', #{@genre}, #{@year}, #{super}"
  end

  def update(params)
    super
    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
    @year = params[:year] if params[:year]
  end

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8', chomp: true)
    self.new(
      title: lines[0],
      author: lines[1],
      genre: lines[2],
      year: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end
end
