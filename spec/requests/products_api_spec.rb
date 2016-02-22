require 'rails_helper'

RSpec.describe 'Products API', type: :request do
  it 'shows a product with plans path' do
    product = create(:product)
    get "/products/#{product.id}.json"

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['plans_path']).to eq product_plans_path(product)
  end
end
