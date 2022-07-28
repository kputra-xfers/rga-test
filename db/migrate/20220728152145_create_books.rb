class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :content_name
      t.string :isbn
      t.integer :year
      t.string :language_code
      t.string :images, array: true, default: []
      t.string :category
      t.text :plot
      t.string :genres, array: true, default: []
      t.string :copyright
      t.string :title
      t.jsonb :wikipedia, null: false, default: '{}'
      t.float :average_rating
      t.integer :rating_count
      t.jsonb :goodreads, null: false, default: '{}'
      t.string :similar_books, array: true, default: []
      t.text :description
      t.string :loc_class
      t.jsonb :gutenberg, null: false, default: '{}'
      t.integer :pages
      t.string :language
      t.string :isbn13
      t.datetime :release_date
      t.references :author, null: false, foreign_key: true
      t.string :cover
      t.text :summary
      t.boolean :content_cleaned
      t.string :classes, array: true, default: []
      t.boolean :content_available

      t.timestamps
    end

    add_index :books, :title
    add_index :books, :year
    add_index :books, :pages
  end
end
