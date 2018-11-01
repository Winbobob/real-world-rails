require 'spec_helper'

RSpec.describe 'Services::Banning::', skip: true do

  describe 'User' do
    let(:user) { Fabricate(:user) }

    it 'should ban a user ' 


    it 'should unban a user' 

  end

  describe 'DeindexUserProtips' do
    before(:each) do
      Protip.rebuild_index
    end

    it 'should deindex all of a users protips' 

  end

  describe 'IndexUserProtips' do
    before(:each) do
      Protip.rebuild_index
    end

    it 'should deindex all of a users protips' 

  end
end

