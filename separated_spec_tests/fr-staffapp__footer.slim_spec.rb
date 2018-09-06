require 'rails_helper'

RSpec.describe 'shared/_footer', type: :view do
  let(:user) { create :user }

  context 'a signed out user' do
    before { render }

    it 'is shown the feedback email address' 

  end

  context 'a signed in user' do
    before do
      sign_in user
      render
    end

    it 'has a link to the feedback form' 

  end
end

