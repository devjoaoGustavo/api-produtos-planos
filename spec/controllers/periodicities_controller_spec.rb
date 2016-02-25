require 'rails_helper'

describe Api::PeriodicitiesController do
  describe 'POST create' do
    context 'with params' do
      it 'creates a periodicity' do
        periodicity_params = { name: 'Name', deadline: 6 }

        post :create, periodicity: periodicity_params, format: :json

        expect(response).to have_http_status(:created)
      end
    end

    context 'with empty params' do
      it 'not creates a periodicity' do
        periodicity_params = { name: '', deadline: nil }

        post :create, periodicity: periodicity_params, format: :json

        expect(response).to_not have_http_status(:created)
      end
    end
  end

  describe 'GET index' do
    it 'get a list of periodicities' do
      periodicities = create_list(:periodicity, 20)

      get :index, format: :json

      expect(JSON.parse(response.body)).to have_content periodicities[4].name
    end
  end

  describe 'GET show' do
    it 'get a specific periodicity' do
      periodicities = create_list(:periodicity, 5)

      get :show, id: periodicities[2].id, format: :json

      expect(JSON.parse(response.body)).to have_content periodicities[2].name
      expect(JSON.parse(response.body))
        .not_to have_content periodicities[3].name
    end
  end

  describe 'PUT update' do
    context 'with params' do
      it 'update the periodicity' do
        periodicity = create(:periodicity)
        periodicity_params = { name: 'Nome alterado', deadline: 24 }

        put :update, id: periodicity.id,
                     periodicity: periodicity_params,
                     format: :json

        expect(response).to have_http_status :success
      end
    end

    context 'with empty params' do
      it 'doesnt update the periodicity' do
        periodicity = create(:periodicity)

        periodicity_params = { name: '', deadline: nil }

        put :update, id: periodicity.id,
                     periodicity: periodicity_params,
                     format: :json

        expect(response).not_to have_http_status :success
      end
    end
  end
end
