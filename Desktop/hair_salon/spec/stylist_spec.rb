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

  describe('#save') do
    it('saves a stylist to an array') do
      stylist = Stylist.new({:name => 'Juanita', :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))  	
    end
  end

  describe('.find') do
    it('finds a stylist based on ID number') do
      stylist = Stylist.new({:name => 'Paris', :id => nil})
      stylist.save()
      expect(Stylist.find(stylist.id)).to(eq(stylist))
    end
  end

   describe('#update') do
    it('lets you update stylists in the database') do
      stylist = Stylist.new({:name => 'Anna', :id => nil})
      stylist.save()
      stylist.update({:name => 'Monica'})
      expect(stylist.name()).to(eq('Monica'))
    end
  end

  describe('#delete') do
  	it('lets you delete stylists in the database') do
  	  stylist = Stylist.new({:name => 'Anna', :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => 'Anna', :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))	
    end
  end
 
  describe('#clients') do
  	it ('returns an array of clients for that stylist') do
  	  stylist = Stylist.new({:name => "Anna", :id => nil})
      stylist.save()
      test_client = Client.new({:id=> nil,:name => "Jamie", :stylist_id => stylist.id(),:phone_number => '5147701159'})
      test_client.save()
      expect(stylist.clients()).to(eq([test_client]))	
  	end	
  end	

  des

end