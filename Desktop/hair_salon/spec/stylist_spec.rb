require('spec_helper')

describe(Stylist) do 
  
  describe('#name') do
    it('returns the name of the stylist') do
      stylist = Stylist.new({:name => 'Juanita', :id => nil})
      expect(stylist.name()).to(eq('Juanita'))	
    end
  end	

  describe('.all') do
  	it('it is an empty array at first') do
  	  expect(Stylist.all()).to(eq([]))	
    end
  end 

	
end