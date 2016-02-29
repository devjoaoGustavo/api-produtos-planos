require 'rails_helper'

feature 'User creates a new plan' do
  scenario 'unsuccessfully' do
    visit new_plan_path

    click_on 'Criar plano'

    %w(Name Description).each do |field|
      expect(page).to have_content "#{field} can\'t be blank"
    end
  end
end
