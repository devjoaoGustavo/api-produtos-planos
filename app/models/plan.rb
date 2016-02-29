class Plan < ActiveRecord::Base
  belongs_to :product
  has_many :prices
  has_many :periodicities, through: :prices

  serialize :details, Array

  validates :name, :description, :product, presence: true

  def valid_prices
    prices.group_by(&:periodicity_id).map { |p| p[1].max }
  end
end
