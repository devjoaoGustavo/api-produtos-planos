class Price < ActiveRecord::Base
  belongs_to :plan
  belongs_to :periodicity

  validates :plan, :periodicity, :value, presence: true
end
