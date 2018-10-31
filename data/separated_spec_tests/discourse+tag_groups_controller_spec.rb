require 'rails_helper'

RSpec.describe TagGroupsController do
  let(:user) { Fabricate(:user) }
  let(:tag_group) { Fabricate(:tag_group) }

  describe '#index' do
    describe 'for a non staff user' do
      it 'should not be accessible' 

    end

    describe 'for a staff user' do
      let(:admin) { Fabricate(:admin) }

      before do
        sign_in(admin)
      end

      it "should return the right response" 

    end
  end
end

