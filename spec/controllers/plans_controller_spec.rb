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

    it 'get a specific plan with its prices for periodicities' do
      plan = create(:plan)
      periodicity_1 = create(:periodicity)
      periodicity_2 = create(:periodicity)
      periodicity_3 = create(:periodicity)
      create(:price, plan_id: plan.id,
                     periodicity_id: periodicity_1.id,
                     value: 105.56)
      price_2 = create(:price, plan_id: plan.id,
                               periodicity_id: periodicity_1.id,
                               value: 200.73)
      create(:price, plan_id: plan.id,
                     periodicity_id: periodicity_2.id,
                     value: 125.95)
      price_4 = create(:price, plan_id: plan.id,
                               periodicity_id: periodicity_2.id,
                               value: 580.59)
      create(:price, plan_id: plan.id,
                     periodicity_id: periodicity_3.id,
                     value: 565.57)
      price_6 = create(:price, plan_id: plan.id,
                               periodicity_id: periodicity_3.id,
                               value: 100.58)

      get :show, id: plan.id, format: :json
      expect(JSON.parse(response.body)).to have_content periodicity_1.name
      expect(JSON.parse(response.body)).to have_content price_2.value
      expect(JSON.parse(response.body)).to have_content periodicity_2.name
      expect(JSON.parse(response.body)).to have_content price_4.value
      expect(JSON.parse(response.body)).to have_content periodicity_3.name
      expect(JSON.parse(response.body)).to have_content price_6.value
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
