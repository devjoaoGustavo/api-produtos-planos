require 'rails_helper'

RSpec.describe 'Plans API', type: :request do
  it 'shows one plan with proper attributes' do
    product = create(:product)
    plan = create(:plan, product: product)
    get "/api/plans/#{plan.id}.json"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['name']).to eq(plan.name)
    expect(json['details']).to eq(plan.details)
    expect(json['description']).to eq(plan.description)
    expect(json['product_id']).to eq(plan.product.id)
    expect(json['product_path']).to eq api_product_path(product)
  end

  it 'shows all plans' do
    NUMBER_OF_PLANS = 20
    create_list(:plan, NUMBER_OF_PLANS)

    get '/api/plans.json'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq NUMBER_OF_PLANS
  end
  it 'shows all prices/periodicities for the specific plan' do
    product = create(:product)
    plan = create(:plan, product: product)
    periodicity = create(:periodicity)
    periodicity2 = create(:periodicity)
    periodicity3 = create(:periodicity)
    periodicity4 = create(:periodicity)
    create(:price, plan: plan, periodicity: periodicity, value: 1.23)
    create(:price, plan: plan, periodicity: periodicity2, value: 3.63)
    create(:price, plan: plan, periodicity: periodicity3, value: 12.54)
    create(:price, plan: plan, periodicity: periodicity4, value: 4.22)

    get "/api/plans/#{plan.id}/prices.json"

    expect(response).to be_success
    expect(JSON.parse(response.body)).to include periodicity.name
    expect(JSON.parse(response.body)).to include periodicity2.name
    expect(JSON.parse(response.body)).to include periodicity3.name
    expect(JSON.parse(response.body)).to include periodicity4.name
    expect(JSON.parse(response.body)).to include 1.23
  end
end
