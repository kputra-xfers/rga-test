authors = JSON.parse(File.read("#{Rails.root}/db/data/authors.json"))['authors']
books = JSON.parse(File.read("#{Rails.root}/db/data/books.json"))['books']

authors.each do |a|
  author = Author.find_or_initialize_by(id: a['id'])
  author.bio =  a['bio']
  author.name = a['name']
  author.gender = a['gender']
  author.wikipedia = a['wikipedia'] || {}
  author.summary = a['summary']
  author.born = a['born']
  author.died = a['died']
  author.save!
end

books.each do |b|
  book = Book.find_or_initialize_by(id: b['id'])
  book.content_name = b['content_name']
  book.isbn = b['isbn']
  book.year = b['year']
  book.language_code = b['language_code']
  book.images = b['images'] || []
  book.category = b['category']
  book.plot = b['plot']
  book.genres = b['genres'] || []
  book.copyright = b['copyright']
  book.title = b['title']
  book.wikipedia = b['wikipedia'] || {}
  book.average_rating = b['average_rating']
  book.rating_count = b['rating_count']
  book.goodreads = b['goodreads'] || {}
  book.similar_books = b['similar_books'] || []
  book.description = b['description']
  book.loc_class = b['content_name']
  book.gutenberg = b['gutenberg'] || {}
  book.pages = b['pages']
  book.language = b['language']
  book.isbn13 = b['isbn13']
  book.release_date = b['release_date']
  book.author_id = b['author']
  book.cover = b['cover']
  book.summary = b['summary']
  book.content_cleaned = b['content_cleaned']
  book.classes = b['classes'] || []
  book.content_available = b['content_available']
  book.save!

  book['authors']&.each do |author_id|
    AuthorBook.create(
      author_id: author_id,
      book_id: book['id'],
    )
  end
end

authors.each do |author|
  author['books']&.each do |book_id|
    AuthorBook.find_or_create_by(
      author_id: author['id'],
      book_id: book_id,
    )
  end
end
