class Publisher < ActiveRecord::Base
  has_many :books, dependent: :destroy
  scope :order_name, -> { order(name: :ASC)}
  scope :search_name, ->(name) { where("name LIKE ?", "%#{name}%") if name.present? }
  scope :search, lambda { |params|
    search_name(params[:name])
  }
end
