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

    describe 'GET index' do
      it 'list twenty products with params' do
        create_list(:plan, 20)

        get :index, format: :json
        expect(JSON.parse(response.body)).to have_content '14 Hospedagem'
      end
    end

    describe 'GET show' do
      it 'get a specific plan' do
        plans = create_list(:plan, 5)

        get :show, id: plans[2].id, format: :json
        expect(JSON.parse(response.body)).to have_content plans[2].name
        expect(JSON.parse(response.body)).not_to have_content plans[3].name
      end
    end

    describe 'POST update' do
      it 'edit a plan' do
        plan = create(:plan)
        product = create(:product, name: 'Produto editado')
        plan_params = { name: 'Plano editado',
                        description: 'Descição editada',
                        details: 'Detalhes editado',
                        product: product }

        put :update, id: plan.id, plan: plan_params, format: :json
        expect(response).to have_http_status(:success)
      end
    end
  end
end
