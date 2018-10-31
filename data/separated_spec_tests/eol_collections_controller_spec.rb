require File.dirname(__FILE__) + '/../../spec_helper'

def do_index
  get :index, :user_id => @collections[:user].id.to_i
  response.should be_success # No sense in continuing otherwise.
end

describe Users::CollectionsController do

  before(:all) do
    truncate_all_tables
    load_foundation_cache
    collections = {}
    collections[:user] = User.gen
    collections[:user2] = User.gen
    collections[:community] = Community.gen
    collections[:collection] = Collection.gen
    collections[:collection].users = [collections[:user]]
    collections[:collection_oldest] = Collection.gen(:created_at => collections[:collection].created_at - 86400)
    collections[:collection_oldest].users = [collections[:user]]
    @collections = collections
  end

  describe 'GET index' do

    before(:each) { do_index }

    it "should instantiate the user through the users controller" 


    it "should instantiate and sort user collections" 


    it "should count collection items"

  end

end

