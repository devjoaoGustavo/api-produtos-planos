require 'rails_helper'

describe Api::PricesController do
  describe 'POST create' do
    context 'successfully' do
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

  describe 'GET index' do
    it 'show all the valid prices for a plans in a periodicity' do
      plan = create(:plan)
      periodicity = create(:periodicity)
      prices = create_list(:price, 5, plan: plan, periodicity: periodicity)

      get :index, plan_id: plan.id,
                  periodicity_id: periodicity.id,
                  format: :json

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to have_content prices[0].value
      expect(JSON.parse(response.body)).to have_content prices[1].value
      expect(JSON.parse(response.body)).to have_content prices[2].value
      expect(JSON.parse(response.body)).to have_content prices[3].value
      expect(JSON.parse(response.body)).to have_content prices[4].value
    end
  end
end
