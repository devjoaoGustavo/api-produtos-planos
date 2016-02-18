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
end
