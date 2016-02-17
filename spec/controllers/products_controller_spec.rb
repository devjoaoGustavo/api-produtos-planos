require 'rails_helper'

describe ProductsController do
  it 'not creates a product' do
    product_params = { name: '',
                       description: '',
                       image: '' }

    post :create, product: product_params, format: :json
    expect(response).to_not have_http_status(:created)
  end

  it 'creates a product with params' do
    product_params = { name: 'Name',
                       description: 'Description',
                       image: 'Image' }

    post :create, product: product_params, format: :json
    expect(response).to have_http_status(:created)
  end

end
