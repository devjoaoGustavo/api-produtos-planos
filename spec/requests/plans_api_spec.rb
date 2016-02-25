require 'rails_helper'

RSpec.describe 'Plans API', type: :request do
  describe 'GET show' do
    it 'shows one plan with proper attributes' do
      product = create(:product)
      plan = create(:plan, product: product)
      get "/api/plans/#{plan.id}.json"

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json['plan']['name']).to eq(plan.name)
      expect(json['plan']['details']).to eq(plan.details)
      expect(json['plan']['description']).to eq(plan.description)
      expect(json['plan']['product_id']).to eq(plan.product.id)
      expect(json['plan']['product_path']).to eq api_product_path(product)
    end
  end

  describe 'GET index' do
    it 'shows all plans' do
      NUMBER_OF_PLANS = 20
      product = create(:product)
      plans = create_list(:plan, NUMBER_OF_PLANS, product: product)

      get "/api/plans.json?product_id=#{product.id}"

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json.count).to eq NUMBER_OF_PLANS
      expect(json[1]['plan_path']).to eq "/api/plans/#{plans[1].id}"
      expect(json[1]['prices_path']).to eq "/api/plans/#{plans[1].id}/prices"
    end
  end
end
