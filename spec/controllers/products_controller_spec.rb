require 'rails_helper'

describe ProductsController do
  describe 'POST create' do
    before do
      FactoryGirl.reload
    end

    it 'creates a product with params' do
      post :create, name: 'Name',
                    description: 'Description',
                    image: open('spec/support/images/image.jpg'),
                    format: :json
      expect(response).to have_http_status(:created)
    end

    context 'with empty params' do
      it 'not creates a product' do
        post :create, name: '',
                      description: '',
                      image: open('spec/support/images/image.jpg'),
                      format: :json
        expect(response).to_not have_http_status(:created)
      end
    end
  end

  describe 'GET index' do
    it 'list twenty products with params' do
      create_list(:product, 20)

      get :index, format: :json
      expect(JSON.parse(response.body)).to have_content '14 Hospedagem'
    end
  end

  describe 'GET show' do
    it 'get a specific product' do
      products = create_list(:product, 5)

      get :show, id: products[2].id, format: :json
      expect(JSON.parse(response.body)).to have_content products[2].name
      expect(JSON.parse(response.body)).to have_content products[2].image

      expect(JSON.parse(response.body)).not_to have_content products[3].name
      expect(JSON.parse(response.body)).not_to have_content products[3].image
    end
  end

  describe 'POST update' do
    it 'edit a product' do
      product = create(:product)

      put :update,
          id: product.id,
          name: 'Nome editado',
          description: 'Descrição editada',
          format: :json

      expect(response).to have_http_status(:success)
    end
  end
end
