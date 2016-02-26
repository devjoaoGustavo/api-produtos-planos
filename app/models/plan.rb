class Plan < ActiveRecord::Base
  belongs_to :product
  has_many :prices
  has_many :periodicities, through: :prices
  accepts_nested_attributes_for :prices
  
  serialize :details, Array

  validates :name, :description, :product, presence: true
end
