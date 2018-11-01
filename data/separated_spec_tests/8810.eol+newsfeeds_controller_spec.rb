require File.dirname(__FILE__) + '/../../spec_helper'

def newsfeeds_do_show
  get :show, community_id: @community.id
end

describe Communities::NewsfeedsController do

  before(:all) do
    @community = Community.gen
  end

  describe 'GET show' do

    it "should instantiate the community" 


  end

end

