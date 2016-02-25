require 'rails_helper'

feature 'User creates a new product' do
  scenario 'Successfully' do
    product = build(:product)
    visit new_product_path

    fill_in 'Nome', with: product.name
    fill_in 'Descrição', with: product.name
    attach_file 'Imagem', 'spec/support/images/image.jpg'
    click_on 'Criar Produto'

    expect(page).to have_content 'Produto criado com sucesso'
    expect(page).to have_content product.name
    expect(page).to have_content product.description
    expect(page).to have_content product.image
  end

  scenario 'Unsuccessfully' do
    visit new_product_path
    click_on 'Criar Produto'

    expect(page).to have_content 'Nome não pode ficar em branco'
    expect(page).to have_content 'Descrição não pode ficar em branco'
    # expect(page).to have_content 'Imagem não pode ficar em branco'
  end
end
