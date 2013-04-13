require 'spec_helper'

describe 'Users' do
  describe 'GET /users/new' do
    it 'displays the new user registration form', :js=>true do
      visit root_path
      click_link('register')
      page.should have_button 'register'
    end
  end
end