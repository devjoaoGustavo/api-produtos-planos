require 'rails_helper'

feature 'User add a new price' do
  scenario 'successfully' do
    plan = create(:plan)

    Periodicity.create(name: 'Mensal',
                       deadline: 1)

    Periodicity.create(name: 'Semestral',
                       deadline: 6)

    Periodicity.create(name: 'Anual',
                       deadline: 12)

    visit edit_plan_path(plan)

    select 'Mensal', from: 'Periodicidade'
    fill_in 'Valor', with: 2.99

    click_on 'Atualizar plano'

    expect(page).to have_content 'Plan was successfully updated'
    expect(page).to have_content '2.99'
  end
end
