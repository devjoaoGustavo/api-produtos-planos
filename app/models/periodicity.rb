class Periodicity < ActiveRecord::Base
  validates :name, :deadline, presence: true
end
