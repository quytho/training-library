class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.references :users, foreign_key: true
      t.references :books, foreign_key: true

      t.timestamps
    end
  end
end
