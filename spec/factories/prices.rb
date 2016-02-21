FactoryGirl.define do
  factory :price do
    sequence :value do |n|
      1.99 + n
    end
    plan
    periodicity
  end
end
