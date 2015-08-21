class Client
  attr_reader(:name, :id, :phone_number)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @phone_number = attributes.fetch(:phone_number)  
  end  	

  define_singleton_method(:all) do
  	returned_clients = DB.exec("SELECT * FROM clients;")
  	clients = []
  	returned_clients.each() do |client|
  	  name = client.fetch('name')
  	  id = client.fetch('id').to_i()
  	  phone_number = client.fetch('phone_number')
  	  clients.push(Client.new({:name => name, :id => id, :phone_number => phone_number}))
  	end  
  	clients
  end	




end	