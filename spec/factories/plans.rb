FactoryGirl.define do
  factory :plan do
    sequence :name do |n|
      "#{n} Hospedagem"
    end
    description 'Hospedagem de domínios na Locaweb.'
    details 'Detalhes do Plano'
    product
  end
end
