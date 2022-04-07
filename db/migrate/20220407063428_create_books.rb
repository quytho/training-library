class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :amount
      t.boolean :status
      t.integer :price
      t.references :authors, foreign_key: true
      t.references :categories, foreign_key: true
      t.references :publishers, foreign_key: true

      t.timestamps
    end
  end
end
