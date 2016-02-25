require 'rails_helper'

RSpec.describe 'Prices API', type: :request do
  describe 'GET show' do
    it 'shows one price with proper paths' do
      price = create(:price)

      get "/api/prices/#{price.id}.json"

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json['plan_path']).to eq api_plan_path(price.plan)
      expect(json['periodicity_path'])
        .to eq api_periodicity_path(price.periodicity)
    end
  end

  describe 'GET index' do
    it 'shows all prices/periodicities for a specific plan' do
      plan = create(:plan)
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
      expect(JSON.parse(response.body).to_json).to include periodicity.name
      expect(JSON.parse(response.body).to_json).to include periodicity2.name
      expect(JSON.parse(response.body).to_json).to include periodicity3.name
      expect(JSON.parse(response.body).to_json).to include periodicity4.name
      expect(JSON.parse(response.body).to_json).to include '1.23'
    end
  end
end
