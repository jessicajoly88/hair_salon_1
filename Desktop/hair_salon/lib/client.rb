class Client
  attr_reader(:name, :stylist_id, :phone_number)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id)  
    @phone_number = attributes.fetch(:phone_number)
  end  	

  define_singleton_method(:all) do
  	returned_clients = DB.exec("SELECT * FROM clients;")
  	clients = []
  	returned_clients.each() do |client|
  	  name = client.fetch('name')
  	  stylist_id = client.fetch('stylist_id').to_i()
  	  phone_number = client.fetch('phone_number')
  	  clients.push(Client.new({:name => name, :stylist_id => nil,:phone_number => phone_number}))
  	end  
  	clients
  end	

  define_method(:==) do |another_client|
    self.name().==(another_client.name())	
   end 	


  define_method(:save) do
    DB.exec("INSERT INTO clients (name, phone_number, stylist_id) VALUES ('#{@name}', '#{@phone_number}', #{@stylist_id});")
  end	


end	