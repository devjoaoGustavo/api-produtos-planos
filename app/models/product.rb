class Product < ActiveRecord::Base
  has_many :plans

  validates :name, :description, presence: true
end
