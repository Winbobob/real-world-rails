require 'rails_helper'

describe 'ability to add an admin to a location' do
  before(:each) do
    @location = create(:location)
  end

  context 'when neither super admin nor location admin' do
    it "doesn't allow adding an admin" 

  end

  context 'when super admin' do
    it 'allows adding an admin' 

  end

  context 'when admin belongs to org' do
    it 'allows adding an admin' 

  end

  context 'when location admin' do
    it 'allows adding an admin' 

  end
end

