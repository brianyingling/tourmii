require 'spec_helper'

describe 'Tours' do
  let(:user) {FactoryGirl.create(:user) }
  describe 'GET /tours' do
    it 'displays a list of all of the user\'s tours', :js=>true do
      register(user)
      login(user)
      visit root_path
      click_link('tours')
      page.should have_text('My Tours')

    end

  end
end


def login(user)
  visit root_path
  fill_in(:email, :with=>user.email)
  fill_in(:password, :with=>user.password)
  click_button('Login')
end

def register(user)
  visit root_path
  click_link('register')
  fill_in('user_first_name',:with=>user.first_name)
  fill_in('user_last_name', :with=>user.last_name)
  fill_in('user_email', :with=>user.email)
  fill_in('user_password', :with=>user.password)
  fill_in('user_password_confirmation', :with=>user.password)
  click_button('register')
end