class User < ActiveRecord::Base
    has_many :borrow_requets
    has_many :follows
    has_many :likes
    has_many :comments
    has_many :rates
end
