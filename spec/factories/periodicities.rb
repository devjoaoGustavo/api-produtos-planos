FactoryGirl.define do
  factory :periodicity do
    sequence :name do |n|
      "#{n} Semestral"
    end
    deadline 6
  end
end
