require 'rails_helper'

describe StreamsHelper, type: :helper do
  include ApplicationHelper

  describe 'stream_item_content' do
    before do
      @user = FactoryGirl.create(:person)
      @group = FactoryGirl.create(:group)
      @membership = @group.memberships.create!(person: @user)
    end

    it 'should be html_safe for messages' 


    it 'should be html_safe for pictures' 

  end
end

