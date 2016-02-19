class Periodicity < ActiveRecord::Base
  has_many :prices
  has_many :plan, through: :prices

  validates :name, :deadline, presence: true
end
