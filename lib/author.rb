class Author
  attr_reader :name,
              :books

  def initialize(data)
    @name  = data[:first_name] + " " + data[:last_name]
    @books = []
  end

  def write(title, date)
    Book.new({author_first_name: @name.split(" ")[0], author_last_name: @name.split(" ")[1], title: title, publication_date: date })
  end

  def add_book(book)
    @books << book
  end
end
