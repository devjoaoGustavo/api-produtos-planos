require 'rails_helper'

RSpec.describe PlansController do
  describe 'POST create' do
    context 'successfully' do
      it 'a new plan' do
        plan_attr = attributes_for(:plan)
        expect { post :create, plan: plan_attr, format: :json }.to change { Plan.count }.from(0).to(1)
      end

      it 'has proper attributes' do
        plan_attr = attributes_for(:plan)
        post :create, plan: plan_attr, format: :json
        expect(JSON.parse(response.body)).to have_content(plan_attr[:name])
        expect(JSON.parse(response.body)).to have_content(plan_attr[:details])
        expect(JSON.parse(response.body)).to have_content(plan_attr[:description])
      end
    end

    context 'invalid' do
      it 'does not create with blank fields' do
        plan_attr = attributes_for(:plan, name: '', details: '', description: '')
        post :create, plan: plan_attr, format: :json
        expect(response).not_to have_http_status(:created)
      end
    end
  end
end
