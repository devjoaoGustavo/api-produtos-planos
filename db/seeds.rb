# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

product = Product.create(name: 'Hospedagem',
                         description: 'Hospedagem de domínios na Locaweb.',
                         image: 'Imagem do produto')

Plan.create(name: 'Profissional',
            description: 'Hospedagem de domínios na Locaweb.',
            details: 'Detalhes do Plano',
            product: product)
