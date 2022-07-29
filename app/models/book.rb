class Book < ApplicationRecord
  belongs_to :author
  has_many :author_books
  has_many :authors, through: :author_books

  paginates_per 25

  def self.filter_by_authors(author_names)
    where(
      id: AuthorBook.where(
        author_id: Author.filter_by_names(author_names).pluck(:id)
      ).pluck(:book_id)
    )
  end

  def self.filter_by_years(years)
    years = years.split(',').map { |str| str.strip.to_i }

    where(year: years)
  end

  def self.filter_by_pages(min_page, max_page)
    return where('pages >= :min_page', { min_page: min_page.to_i }) if max_page.blank?
    return where('pages <= :max_page', { max_page: max_page.to_i }) if min_page.blank?

    where('pages >= :min_page and pages <= :max_page', { min_page: min_page.to_i, max_page: max_page.to_i })
  end

  def similar_book_records
    Book.where(title: similar_books)
  end
end
