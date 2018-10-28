require 'rails_helper'

describe 'Navbar', js: true do
  before do
    visit root_path
  end

  it 'exist' 


  context 'logo' do
    it 'exist' 

  end

  context 'when user not logged in' do
    it 'not render content for auth user' 

  end

  context 'when user logged in' do
    before do
      login
    end

    it 'render correct links' 

  end
end

