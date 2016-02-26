require 'rails_helper'

feature 'User add a new price'do
  scenario 'successfully' do

    plan = create(:plan)

    Periodicity.create(name: 'Mensal',
                       deadline: 1)

    Periodicity.create(name: 'Semestral',
                       deadline: 6)

    Periodicity.create(name: 'Anual',
                       deadline: 12)

    visit edit_plan_path(plan)

    click_on 'Adicionar periodicidade'
    select 'Mensal', from: 'Periodicidade'
    fill_in 'price_details_0', with: 2.99

    click_on 'Adicionar periodicidade'
    select 'Semestral', from: 'Periodicidade'
    fill_in 'price_details_1', with: 12.99

    click_on 'Adicionar periodicidade'
    select 'Anual', from: 'Periodicidade'
    fill_in 'price_details_2', with: 32.99

    click_on 'Criar plano'

  end
end
