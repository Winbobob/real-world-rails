require 'spec_helper'

describe ApplicationHelper do
  describe '#display_in_hours' do
    it 'formats positive durations' 


    it 'formats negative durations' 


    it 'rounds minutes' 


    it 'rounds correctly' 

  end

  describe '#selectable_users' do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:deactivated_user) { FactoryGirl.create(:user, active: false) }

    it 'won\'t include deactivated users' 

  end
end

