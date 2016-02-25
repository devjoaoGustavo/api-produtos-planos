require 'rails_helper'

describe Api::PricesController do
  describe 'POST create' do
    it 'adds a new price for a plan' do
      plan = create(:plan)
      periodicity = create(:periodicity)

      post :create, plan_id: plan.id,
                    periodicity_id: periodicity.id,
                    value: 1.99,
                    format: :json

      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET show' do
    it 'shows a price for a plan in a periodicity' do
      plan = create(:plan)
      periodicity = create(:periodicity)
      price = create(:price, plan: plan, periodicity: periodicity)

      get :show, id: price.id,
                 plan_id: plan.id,
                 periodicity_id: periodicity.id,
                 format: :json

      expect(response).to have_http_status(:success)
    end
  end
end
