class Plan < ActiveRecord::Base
  belongs_to :product
  has_many :prices
  has_many :periodicities, through: :prices

  serialize :details, Array

  validates :name, :details, :description, :product, presence: true
end
