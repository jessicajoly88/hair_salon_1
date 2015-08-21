class Client
  attr_reader(:name, :id, :stylist_id, :phone_number)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @stylist_id = attributes.fetch(:stylist_id) 
    @id = attributes.fetch(:id) 
    @phone_number = attributes.fetch(:phone_number)
  end  	

  define_singleton_method(:all) do
  	returned_clients = DB.exec("SELECT * FROM clients;")
  	clients = []
  	returned_clients.each() do |client|
  	  name = client.fetch('name')
  	  id = client.fetch('id').to_i()
  	  stylist_id = client.fetch('stylist_id').to_i()
  	  phone_number = client.fetch('phone_number')
  	  clients.push(Client.new({:name => name,:id=> nil, :stylist_id => nil,:phone_number => phone_number}))
  	end  
  	clients
  end	

  define_method(:==) do |another_client|
    self.name().==(another_client.name())	
   end 	

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, phone_number, stylist_id) VALUES ('#{@name}', '#{@phone_number}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end	

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    @phone_number = attributes.fetch(:phone_number, @phone_number)
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{self.id()};")
    DB.exec("UPDATE clients SET phone_number = '#{@phone_number}' WHERE id = #{self.id()};")
  end

  define_method(:delete) do 
  	 DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end	
  
end	