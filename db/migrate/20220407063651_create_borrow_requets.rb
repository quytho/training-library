class CreateBorrowRequets < ActiveRecord::Migration[6.0]
  def change
    create_table :borrow_requets do |t|
      t.date :borrow_date
      t.date :return_date
      t.boolean :status
      t.references :users, foreign_key: true
      t.references :books, foreign_key: true
      
      t.timestamps
    end
  end
end
