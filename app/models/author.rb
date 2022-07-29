class Author < ApplicationRecord
  has_many :author_books
  has_many :books
  has_many :authored_books, through: :author_books, source: :book

  paginates_per 25

  def self.filter_by_names(names)
    names = names.split(',').map { |str| "%#{str.strip}%" }.join(',')
    where("name ilike any (:author_name)", { author_name: "{#{names}}" })
  end
end
