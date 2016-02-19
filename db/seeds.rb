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

plan = Plan.create(name: 'Profissional',
                   description: 'Plano profissional com todos os opcionais.',
                   details: 'Detalhes do plano.',
                   product: product)

periodicity = Periodicity.create(name: 'Semestral',
                                 deadline: 6)

Price.create(plan: plan,
             periodicity: periodicity,
             value: 1.99)
