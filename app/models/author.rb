class Author < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :authored_books, through: :author_books, source: :book

  paginates_per 25

  validates :name, presence: true

  def self.filter_by_names(names)
    names = names.split(',').map { |str| "%#{str.strip}%" }.join(',')
    where("name ilike any (:author_name)", { author_name: "{#{names}}" })
  end

  def show_book_ids
    authored_books.pluck(:id).join(', ')
  end
end
