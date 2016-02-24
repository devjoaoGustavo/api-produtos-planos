FactoryGirl.define do
  factory :plan do
    sequence :name do |n|
      "#{n} Profissional"
    end
    description 'Plano profissional com todos os opcionais.'
    details ['Detalhes do plano.']
    product
  end
end
