require 'rails_helper'

feature 'User edits products' do
  context 'Successfully' do
    scenario 'with arguments' do
      product = create(:product)
      visit edit_product_path(product)

      fill_in 'Nome', with: 'Mail Marketing'
      fill_in 'Descrição', with: 'Muito mais mensagens com pacotes especiais'
      attach_file 'Imagem', 'spec/support/images/email.jpg'
      click_on 'Atualizar Produto'

      expect(page).to have_content 'Mail Marketing'
      expect(page).to have_content 'Muito mais mensagens com pacotes especiais'
      expect(page).to have_css "img[src*='email.jpg']"
    end
  end
end
