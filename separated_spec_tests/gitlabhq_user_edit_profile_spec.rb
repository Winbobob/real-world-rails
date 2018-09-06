require 'spec_helper'

describe 'User edit profile' do
  let(:user) { create(:user) }

  before do
    sign_in(user)
    visit(profile_path)
  end

  it 'changes user profile' 


  context 'user avatar' do
    before do
      attach_file(:user_avatar, Rails.root.join('spec', 'fixtures', 'banana_sample.gif'))
      click_button 'Update profile settings'
    end

    it 'changes user avatar' 


    it 'removes user avatar' 

  end
end

