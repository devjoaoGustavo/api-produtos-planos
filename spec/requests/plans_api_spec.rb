require 'rails_helper'

RSpec.describe 'Plans API', type: :request do
  it 'shows one plan with proper attributes' do
    product = create(:product)
    plan = create(:plan, product: product)
    get "/plans/#{plan.id}.json"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['name']).to eq(plan.name)
    expect(json['details']).to eq(plan.details)
    expect(json['description']).to eq(plan.description)
    expect(json['product_id']).to eq(plan.product.id)
    expect(json['product_path']).to eq product_path(product)
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
    expect(json[0]).to include plan1.name
    expect(json[0]).to include plan1.product.id.to_s
    expect(json[0]).to include product_path(plan1.product)
    expect(json[1]).to include plan2.name
    expect(json[1]).to include plan2.product.id.to_s
    expect(json[1]).to include product_path(plan2.product)
  end
end
