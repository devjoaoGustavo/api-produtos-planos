require 'rails_helper'

describe PeriodicitiesController do
  describe 'POST create' do
    it 'creates a periodicity with params' do
      periodicity_param = { name: 'Name',
                            deadline: 6 }

      post :create, periodicity: periodicity_param, format: :json
      expect(response).to have_http_status(:created)
    end

    context 'with empty params' do
      it 'not creates a periodicity' do
        periodicity_param = { name: '',
                              deadline: nil }

        post :create, periodicity: periodicity_param, format: :json
        expect(response).to_not have_http_status(:created)
      end
    end
  end

  describe 'GET show' do
    it 'get a list of periodicities' do
      periodicities = create_list(:periodicity, 20)

      get :index, format: :json

      expect(JSON.parse(response.body)).to have_content periodicities[4].name
    end

    it 'get a specific periodicity' do
      periodicities = create_list(:periodicity, 5)

      get :show, id: periodicities[2].id, format: :json

      expect(JSON.parse(response.body)).to have_content periodicities[2].name
      expect(JSON.parse(response.body))
        .not_to have_content periodicities[3].name
    end
  end
end
