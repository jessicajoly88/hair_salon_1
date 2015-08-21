require('spec_helper')

describe(Client) do
	
  describe('#name') do
    it('returns the name of the client') do
      client = Client.new({:name => 'Juanita', :stylist_id => 1, :phone_number => '5147701159'})
      expect(client.name()).to(eq('Juanita'))	
    end
  end	

  describe('.all') do
    it('is an empty array at first') do
      expect(Client.all()).to(eq([]))	
    end	
  end 

  describe('#save') do
    it('saves a client to an array ') do
      test_client = Client.new({:name => 'Juanita', :phone_number => '5147701159', :stylist_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end	
  end 	

  describe('#==') do
    it('recognizes two objects with the same properties as equal') do
      test_client = Client.new({:name => 'Juanita', :stylist_id => 1, :phone_number => '5147701159'})
      test_client2 = Client.new({:name => 'Juanita', :stylist_id => 1, :phone_number => '5147701159'})
      expect(test_client).to(eq(test_client2))
    end	
  end	
 
  describe('#update') do
    it('lets you update clients in the database') do
      test_client = Client.new({:name => 'Juanita', :stylist_id => 1, :phone_number => '5147701159'}) 
      test_client.save()
      test_client.update({:name => 'Marguerite', :stylist_id => 1, :phone_number => '5147175911'})
      expect(test_client.name).to(eq('Marguerite'))
    end	
  end	
 

end