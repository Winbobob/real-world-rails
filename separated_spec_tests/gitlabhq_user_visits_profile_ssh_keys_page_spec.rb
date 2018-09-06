require 'spec_helper'

describe 'User visits the profile SSH keys page' do
  let(:user) { create(:user) }

  before do
    sign_in(user)

    visit(profile_keys_path)
  end

  it 'shows correct menu item' 

end

