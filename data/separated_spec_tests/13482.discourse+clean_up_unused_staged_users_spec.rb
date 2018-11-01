require 'rails_helper'

RSpec.describe Jobs::CleanUpUnusedStagedUsers do
  let(:user) { Fabricate(:user) }
  let(:staged_user) { Fabricate(:user, staged: true) }

  context 'when staged user is unused' do
    it 'should clean up the staged user' 


    describe 'when staged user is not old enough' do
      it 'should not clean up the staged user' 

    end
  end

  context 'when staged user is not unused' do
    it 'should not clean up the staged user' 

  end
end

