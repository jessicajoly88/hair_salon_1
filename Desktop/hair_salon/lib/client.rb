class Client
  attr_reader(:name, :id, :phone_number)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @phone_number = attributes.fetch(:phone_number)  
  end  	

end	