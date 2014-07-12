require 'spec_helper'

describe 'GET /' do
  it 'shows the nav bar' do
    visit root_path
    page.should have_text('Tourmii')
  end
  it 'shows an image for the background' do
    visit root_path
    page.should have_css('.image-container')
  end
end