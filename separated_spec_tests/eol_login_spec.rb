require "spec_helper"

describe 'Login' do
  before :all do
    load_foundation_cache
    Capybara.reset_sessions!
  end

  after :all do
    truncate_all_tables
  end

  after :each do
    visit('/logout')
  end

  it 'login page should render OK' 


  it 'should redirect us back to login if we logged in incorrectly' 


  it 'should tell us if we logged in incorrectly' 


  it 'should redirect to user show after a successful login' 


  it 'should set a remember token for us if we asked to be remembered' 


  it 'should indicate to user that they are logged in' 


  it 'should be able to logout user' 


  it 'should redirect user to return_to url if user successfully log in after a failed attempt' 


  it 'should redirect user to return_to url if user successfully log in after a failed attempt' 


end


