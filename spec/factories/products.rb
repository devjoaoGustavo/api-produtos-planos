FactoryGirl.define do
  factory :product do
    sequence :name do |n|
      "#{n} Hospedagem"
    end
    description 'Hospedagem de domínios na Locaweb.'
    image 'Imagem do produto'
  end
end
