require 'spec_helper'

describe 'Logout/Sign out', :js do
  let(:user) { create(:user) }

  before do
    sign_in(user)
    visit root_path
  end

  it 'sign out redirects to sign in page' 


  it 'sign out does not show signed out flash notice' 

end

