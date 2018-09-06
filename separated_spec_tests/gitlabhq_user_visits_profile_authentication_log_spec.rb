require 'spec_helper'

describe 'User visits the authentication log' do
  let(:user) { create(:user) }

  context 'when user signed in' do
    before do
      sign_in(user)
    end

    it 'shows correct menu item' 

  end

  context 'when user has activity' do
    before do
      create(:closed_issue_event, author: user)
      gitlab_sign_in(user)
    end

    it 'shows user activity' 

  end
end

