FactoryGirl.define do
  factory :product do
    sequence :name do |n|
      "#{n} Hospedagem"
    end
    description 'Hospedagem de domínios na Locaweb.'
    image File.open('spec/support/images/image.jpg')
  end
end
