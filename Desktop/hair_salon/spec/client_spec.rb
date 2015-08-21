require('spec_helper')

describe(Client) do
	
  describe('#name') do
    it('returns the name of the client') do
      client = Client.new({:name => 'Juanita', :id => nil, :phone_number => '5147701159'})
      expect(client.name()).to(eq('Juanita'))	
    end
  end	




end