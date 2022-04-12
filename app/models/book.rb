class Book < ActiveRecord::Base
    belongs_to :author
    belongs_to :category
    belongs_to :publisher

    has_many :borrow_requets
    has_many :follows
    has_many :likes
    has_many :comments
    has_many :rates

end
