require("sinatra")
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/stylist')
require('./lib/client')
require('pg')

DB = PG.connect({:dbname => "hair_salon_test"})

get('/') do
  @stylists = Stylist.all()
   erb(:index)
end

post('/') do
  name = params.fetch('name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  erb(:success)	
end

post('/stylists') do
  name = params.fetch('name')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylist = stylist
  erb(:success)	
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist_specific)
end

patch('/stylists/:id') do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.update({:name => name})
  erb(:stylist_specific)
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end