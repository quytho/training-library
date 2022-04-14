module BooksHelper
  def find_author(book)
    author = Author.find(book.author_id)
  end
  def find_rate(book)
    rate = Rate.find(book.id)
  end
end
