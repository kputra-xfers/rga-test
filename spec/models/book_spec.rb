require 'rails_helper'

RSpec.describe Book, :type => :model do
  describe 'validations' do
    before do
      author = create(:author)
      @book = Book.new(
        author: author,
        title: 'Title',
        pages: 200,
        year: 1995,
      )
    end

    it 'is valid with valid attributes' do
      expect(@book).to be_valid
    end
  
    it 'is not valid without a title' do
      @book.title = nil

      expect(@book).to_not be_valid
    end

    it 'is not valid without total pages' do
      @book.pages = nil

      expect(@book).to_not be_valid
    end

    it 'is not valid without publication year' do
      @book.year = nil

      expect(@book).to_not be_valid
    end
  end

  describe '#show_author_ids' do
    it 'shows author ids in string format' do
      authors = create_list(:author, 5)
      book = Book.create(author: authors[0], title: 'Title', pages: 200, year: 1995)

      authors.each do |author|
        AuthorBook.create(author_id: author.id, book_id: book.id)
      end

      expected_result = authors.pluck(:id).join(', ')

      expect(book.show_author_ids).to eq expected_result
    end
  end
end
