FactoryGirl.define do
  factory :product do
    sequence :name do |n|
      "#{n} Hospedagem"
    end
    description 'Hospedagem de domínios na Locaweb.'
    image do
      Rack::Test::UploadedFile.new(
        File.join(
          Rails.root, 'spec/support/images/image.jpg'))
    end
  end
end
