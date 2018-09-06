require 'spec_helper'

describe 'User visits the profile account page' do
  let(:user) { create(:user) }

  before do
    sign_in(user)

    visit(profile_account_path)
  end

  it 'shows correct menu item' 

end

