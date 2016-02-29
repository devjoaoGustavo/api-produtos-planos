# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

product = Product.create(name: 'Hospedagem',
                         description: 'Hospedagem de domínios na Locaweb.',
                         image: open('spec/support/images/image.jpg'))

product_2 = Product.create(name: 'Email',
                          description: 'Email da Locaweb.',
                          image: open('spec/support/images/image.jpg'))

plan = Plan.create(name: 'Profissional',
                   description: 'Plano profissional com todos os opcionais.',
                   details: ['Detalhes 1', 'Detalhes 2'],
                   product: product)

plan_2 = Plan.create(name: 'Básico',
                     description: 'Plano básico com todos os opcionais.',
                     details: ['Detalhes 1', 'Detalhes 2'],
                     product: product)

plan_3 = Plan.create(name: 'Plus',
                    description: 'Plano plus com todos os opcionais.',
                    details: ['Detalhes 1', 'Detalhes 2'],
                    product: product_2)

plan_3 = Plan.create(name: 'Plus',
                   description: 'Plano plus com todos os opcionais.',
                   details: ['Detalhes do plano.'],
                   product: product_2)

periodicity_1 = Periodicity.create(name: 'Semestral',
                                 deadline: 6)
periodicity_2 = Periodicity.create(name: 'Mensal',
                                 deadline: 1)
periodicity_3 = Periodicity.create(name: 'Anual',
                                 deadline: 12)

Price.create(plan: plan,
             periodicity: periodicity_1,
             value: 1.99)
Price.create(plan: plan_2,
             periodicity: periodicity_1,
             value: 2.99)
Price.create(plan: plan_3,
             periodicity: periodicity_1,
             value: 3.99)

Price.create(plan: plan,
             periodicity: periodicity_2,
             value: 4.99)
Price.create(plan: plan_2,
             periodicity: periodicity_2,
             value: 5.99)
Price.create(plan: plan_3,
            periodicity: periodicity_2,
            value: 6.99)

Price.create(plan: plan,
             periodicity: periodicity_3,
             value: 7.99)
Price.create(plan: plan_2,
             periodicity: periodicity_3,
             value: 8.99)
Price.create(plan: plan_3,
             periodicity: periodicity_3,
             value: 9.99)
