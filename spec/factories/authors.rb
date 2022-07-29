FactoryBot.define do
  factory :author do
    name { 'name' }
    gender { 'm' }
    bio { 'long bio' }
    wikipedia {{ url: 'https://wikipedia.com' }}
    summary { 'long summary' }
    born { Time.now - 50.years }
    died { Time.now - 10.years }

    trait :with_3_books do
      after(:create) do |author|
        (1..3).each do |x|
          book = create(:book, title: "Book #{x}", pages: 100 * x, year: 1990 + x, author_id: author.id)
          AuthorBook.create(author_id: author.id, book_id: book.id)
        end
      end
    end

    trait :with_50_books do
      after(:create) do |author|
        (1..50).each do |x|
          book = create(:book, title: "Book #{x}", author_id: author.id)
          AuthorBook.create(author_id: author.id, book_id: book.id)
        end
      end
    end
  end
end
