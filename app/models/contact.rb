class Contact < ActiveRecord::Base
  belongs_to :kind       #pertence a um tipo
  has_one :address       #o contato tem um unico endereço
  has_many :phones
  accepts_nested_attributes_for :address    #esse model aceita atributos do endereço
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: :true
end



#procedimento no rails c
#2.1.2 :004 > params = {contact:{name:"Jack" , email:"jack@gmail.com" , rmk:"sjaosaojsaj" , address_attributes:{street:"rua tal", city:"Manchester", state:"North England"}}}
# => {:contact=>{:name=>"Jack", :email=>"jack@gmail.com", :rmk=>"sjaosaojsaj", :address_attributes=>{:street=>"rua tal", :city=>"Manchester", :state=>"North England"}}}
#2.1.2 :005 > Contact.create!(params[:contact])   (0.2ms)  begin transaction
#  SQL (0.6ms)  INSERT INTO "contacts" ("created_at", "email", "name", "rmk", "updated_at") VALUES (?, ?, ?, ?, ?)  [["created_at", "2018-02-14 08:54:14.741151"], ["email", "jack@gmail.com"], ["name", "Jack"], ["rmk", "sjaosaojsaj"], ["updated_at", "2018-02-14 08:54:14.741151"]]
#  SQL (0.3ms)  INSERT INTO "addresses" ("city", "contact_id", "created_at", "state", "street", "updated_at") VALUES (?, ?, ?, ?, ?, ?)  [["city", "Manchester"], ["contact_id", 11], ["created_at", "2018-02-14 08:54:14.747929"], ["state", "North England"], ["street", "rua tal"], ["updated_at", "2018-02-14 08:54:14.747929"]]
#   (33.9ms)  commit transaction
# => #<Contact id: 11, name: "Jack", email: "jack@gmail.com", kind_id: nil, rmk: "sjaosaojsaj", created_at: "2018-02-14 08:54:14", updated_at: "2018-02-14 08:54:14">
#2.1.2 :006 >