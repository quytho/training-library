class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.integer :star
      t.references :users, foreign_key: true
      t.references :books, foreign_key: true
      
      t.timestamps
    end
  end
end
