require 'rails_helper'

RSpec.describe PlansController do
  describe 'POST create' do
    it 'a new plan' do
      plan_attr = build(:plan).attributes
      expect { post :create, plan: plan_attr, format: :json }
        .to change { Plan.count }.from(0).to(1)
    end

    it 'does not create with blank fields' do
      plan_attr = attributes_for(:plan, name: '', details: '', description: '',
                                        product: nil)
      post :create, plan: plan_attr, format: :json
      expect(response).not_to have_http_status(:created)
    end
  end
  describe 'POST create_price' do
    context 'successfully' do
      it 'adds a new price for a plan' do
        plan = create(:plan)
        periodicity = create(:periodicity)
        price_params = { value: 1.99, periodicity: periodicity.attributes }

        post :create_price, id: plan.id, price: price_params , format: :json
        expect(response).to have_http_status(:created)
      end
    end
    context 'unsuccessfully' do
      it 'adds a new price without a periodicity' do
        plan = create(:plan)
        price_params = { value: 5.00, periodicity: nil }

        post :create_price, id: plan.id, price: price_params , format: :json
        expect(response).not_to have_http_status(:created)
      end
    end
  end
end
