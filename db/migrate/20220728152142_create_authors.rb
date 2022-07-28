class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.text :bio
      t.string :name
      t.string :gender
      t.jsonb :wikipedia, null: false, default: '{}'
      t.text :summary
      t.datetime :born
      t.datetime :died

      t.timestamps
    end
  end
end
