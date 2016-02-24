require 'rails_helper'

RSpec.describe 'Prices API', type: :request do
  it 'shows one price with proper paths' do
    price = create(:price)

    get "/api/prices/#{price.id}.json"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['plan_path']).to eq api_plan_path(price.plan)
    expect(json['periodicity_path']).to eq api_periodicity_path(price.periodicity)
  end
end
