class Product < ActiveRecord::Base
  has_many :plans

  mount_uploader :image, ImageUploader

  validates :name, :description, :image, presence: true
end
