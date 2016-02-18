require 'rails_helper'

RSpec.describe 'Plans API', type: :request do
  it 'shows one plan with proper attributes' do
    plan = create(:plan)
    get "/plans/#{plan.id}.json"

    json = JSON.parse(response.body)
    expect(response).to be_success
    expect(json['name']).to eq(plan.name)
    expect(json['details']).to eq(plan.details)
    expect(json['description']).to eq(plan.description)
    expect(json['product_id']).to eq(plan.product.id)
  end

  it 'shows all plans' do
    NUMBER_OF_PLANS = 20
    create_list(:plan, NUMBER_OF_PLANS)
    get '/plans.json'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json.count).to eq NUMBER_OF_PLANS
  end

  it 'shows two different plans with proper attributes' do
    plan1 = create(:plan)
    product = create(:product, name: 'Produto')
    plan2 = create(:plan, name: 'Email', product: product)

    get '/plans.json'

    json = JSON.parse(response.body)

    expect(response).to be_success

    expect(json[0]['name']).to eq plan1.name
    expect(json[0]['product_id']).to eq plan1.product.id
    expect(json[1]['name']).to eq plan2.name
    expect(json[1]['product_id']).to eq plan2.product.id
  end
end
