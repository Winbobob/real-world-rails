require 'spec_helper'

describe ExploreHelper do
  let(:user) { build(:user) }

  before do
    allow(helper).to receive(:current_user).and_return(user)
    allow(helper).to receive(:can?) { true }
  end

  describe '#explore_nav_links' do
    it 'has all the expected links by default' 

  end
end

