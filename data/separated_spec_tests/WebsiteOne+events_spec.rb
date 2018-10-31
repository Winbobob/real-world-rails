require 'spec_helper'
require 'capybara/rspec'
describe 'Events' do

  let(:user){ User.create!(email: 'something_else@email.com', password: '123456789')}

  before { login }

  it 'allows prepopulation of form with name' 


  it 'allows prepopulation of form with category' 


  it 'allows prepopulation of form with project' 


  def login
    StaticPage.create!(title: 'getting started', body: 'remote pair programming' )
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: '123456789'
    click_button 'Sign in'
  end
end

