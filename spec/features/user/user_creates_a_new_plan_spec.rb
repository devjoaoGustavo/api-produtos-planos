require 'rails_helper'

feature 'User creates a new plan' do
  scenario 'successfully' do
    product = create(:product)

    visit new_plan_path

    fill_in 'Nome', with: 'Premium'
    fill_in 'Descrição', with: 'Plano premium'
    fill_in 'Detalhes', with: 'Armazenamento ilimitado'
    select product.name, from: 'Produto'

    click_on 'Criar plano'

    expect(page).to have_content 'Premium'
    expect(page).to have_content 'Plano premium'
    expect(page).to have_content 'Armazenamento ilimitado'
    expect(page).to have_content product.name
  end

  scenario 'unsuccessfully' do
    visit new_plan_path

    click_on 'Criar plano'

    %w(Nome Descrição Detalhes Produto).each do |field|
      expect(page).to have_content "#{field}can\'t be blank"
    end
  end
end
