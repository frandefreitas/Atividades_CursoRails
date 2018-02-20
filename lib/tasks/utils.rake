#"rake db:drop db:create db:migrate db:seed utils:seed" para compilar com o que ja esta no seed


namespace :utils do
  desc "Popular banco de dados, ele foi criado com 'rails g task utils seed'" 
  task seed: :environment do
  

    puts "Gerando os contato (Contacts)..."
      10.times do |i|                                    #repetição de 1 a 10       
         Contact.create!(
           name: Faker::Name.name,        
           email: Faker::Internet.email,    
           kind: Kind.all.sample,                        
           rmk: Faker::Lorem.paragraph([1,2,3,4,5].sample)   
         )
      end
    puts "Gerando os contato (Contacts)... Sucess"


    puts "Gerando os endereços (Adresses)..."
      Contact.all.each do |_contact|                      #um registro para cada contato com endereço, cidade e estado
        Address.create!(
          street: Faker::Address.street_address,
          city: Faker::Address.city,
          state: Faker::Address.state_abbr,
          contact: _contact
        )
      end
    puts "Gerando os endereços (Adresses)... Sucess"
   

    puts "Gerando os telefones (Phones)..."
      Contact.all.each do |_contact|                           
        Random.rand(1..5).times do |i|                  #repetição aleatória que o contato pode ter 1 ou 2 ou 3 ou 4 ou 5 telefones
          Phone.create!(
            phone: Faker::PhoneNumber.phone_number,
            contact: _contact                    
          )
        end
      end
    puts "Gerando os telefones (Phones)... Sucess"
  
end
end
