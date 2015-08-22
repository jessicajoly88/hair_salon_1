require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('hair salon app',{:type => :feature}) do

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to add a new stylist on the index page') do
    visit('/')
    fill_in('name', :with =>'Marissa')
    click_button('Add a Stylist')
    expect(page).to have_content('Success!')
  end
end


end	