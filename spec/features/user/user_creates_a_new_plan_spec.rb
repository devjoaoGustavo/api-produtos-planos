require 'rails_helper'

feature 'User creates a new plan' do
  scenario 'unsuccessfully' do
    visit new_plan_path

    click_on 'Criar plano'

    %w(Nome Descrição Produto).each do |field|
      expect(page).to have_content "#{field} não pode ficar em branco"
    end
  end
end
