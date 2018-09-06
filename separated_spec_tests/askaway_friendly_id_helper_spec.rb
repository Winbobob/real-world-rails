require 'rails_helper'

describe "FriendlyIdHelper" do
  let(:user) { FactoryGirl.create(:user) }

  # FIXME: technically we should be defining a generic
  #        class here to test FriendlyIdHelper with
  #        instead of using Question. But I couldn't find
  #        an easy way of doing that. (-JL)
  describe 'slugs' do
    it 'increments duplicate questions nicely' 


    it 'truncates after 13 words or 80 characters' 


    it 'changes slug if body changes' 

  end
end

