FactoryGirl.define do
  factory :product do
    sequence :name do |n|
      "#{n} MyString"
    end
    description 'MyText'
    image 'MyString'
  end
end
