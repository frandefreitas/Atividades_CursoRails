# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Kind.create(description:"Amigo")
#Kind.create(description:"Contato")
#Kind.create(description:"Comercial")
puts "Gerando os tipos de contato (Kinds)..."
  Kind.create!([{description:"Faculdade"},
                {description:"Futebol"},
                {description:"Igreja"},
                {description:"Vizinhança"}])
puts "Gerando os tipos de contato (Kinds)... Sucess"

#se deixar aqui apenas dados que sempre vão estar em produção





#puts "Gerando os tipos de contato (Contacts)..."
# 10.times do |i|
#    Contact.create!(name: Faker::Name.name,         #Faker instalado para utilizar nome falso
#      email: Faker::Internet.email,     #Faker para utilizar email falso
#      kind: Kind.all.sample,                        #seleciona todos os elementos e pega uma amostra de exemplo
#      rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)     #Faker para utlizar paragrafos de 1 a 5
#    )
# end
#puts "Gerando os tipos de contato (Contacts)... Sucess"