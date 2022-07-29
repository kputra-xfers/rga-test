FactoryBot.define do
  factory :book do
    title { 'Book Title' }
    pages { 200 }
    year { 1995 }
    description { 'long description' }
    plot { 'long plot' }
    similar_books {['Nothing', 'Happened']}
    wikipedia {{ url: 'https://wikipedia.com' }}
  end
end
