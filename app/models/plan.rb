class Plan < ActiveRecord::Base
  validates :name, :details, :description, presence: true
end
