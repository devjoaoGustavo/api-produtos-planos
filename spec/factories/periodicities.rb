FactoryGirl.define do
  factory :periodicity do
    sequence :name do |n|
      "Semestral#{n}"
    end
    deadline 6
  end
end
