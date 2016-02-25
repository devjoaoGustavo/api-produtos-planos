require 'rails_helper'

RSpec.describe Api::PlansController do
  describe 'POST create' do
    context 'with params' do
      it 'creates a new plan' do
        product = create(:product)
        plan_params = { name: 'Hospedagem',
                        description: 'Descrição',
                        details: ['5 gb gratuitos',
                                  '2 contas de email',
                                  'Domínio grátis'],
                        product_id: product.id }

        expect { post :create, plan: plan_params, format: :json }
          .to change { Plan.count }.by(1)
      end
    end

    context 'with empty or nil params' do
      it 'does not create' do
        plan_attr = attributes_for(:plan, name: '',
                                          details: '',
                                          description: '',
                                          product: nil)
        post :create, plan: plan_attr, format: :json
        expect(response).not_to have_http_status(:created)
      end
    end
  end

  describe 'GET index' do
    it 'list twenty products for a ' do
      product = create(:product)
      create_list(:plan, 20, product: product)

      get :index, product_id: product.id, format: :json
      expect(JSON.parse(response.body)).to have_content '14 Profissional'
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
      product = create(:product)
      product_2 = create(:product, name: 'Web mail')
      plan = create(:plan, product: product)
      plan_params = { name: 'Hospedagem editado',
                      description: 'Descrição editada',
                      details: 'Detalhes editado',
                      product_id: product_2.id }

      put :update, id: plan.id, plan: plan_params, format: :json

      expect(response).to have_http_status(:success)
    end
  end
end
