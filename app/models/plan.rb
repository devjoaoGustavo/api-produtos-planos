class Plan < ActiveRecord::Base
  belongs_to :product

  validates :name, :details, :description, :product, presence: true
end
