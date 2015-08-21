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

  describe('#==') do
    it('recognizes two objects with the same properties as equal') do
      stylist = Stylist.new({:name => 'Juanita', :id => nil})
      another_stylist = Stylist.new({:name => 'Juanita', :id => nil})
      expect(stylist).to(eq(another_stylist))  	
    end	
  end	
	
end