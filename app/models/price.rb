class Price < ActiveRecord::Base
  belongs_to :plan
  belongs_to :periodicity

  validates :plan, :periodicity, :value, presence: true

  def self.in_order(plan_id, periodicity_id)
    where(plan_id: plan_id, periodicity_id: periodicity_id)
      .order(id: :desc)
  end
end
