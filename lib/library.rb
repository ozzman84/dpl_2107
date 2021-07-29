class Library
  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
  end

  def add_book(book)
    @books << book
  end

  def publication_time_frame_for(author)
    time_frame = {}
    max = @books.max_by do |max_book|
      min = @books.min_by do |min_book|
        if min_book.author == author.name
          min_book.publication_year.to_i
        end
      end
      if max_book.author == author.name
        max_book.publication_year.to_i
      end
    end
    time_frame[:start] = min.to_s
    time_frame[:end] = max.to_s
    time_frame
  end
end
