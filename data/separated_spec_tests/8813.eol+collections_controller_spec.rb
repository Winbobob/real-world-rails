require "spec_helper"

describe CollectionsController do
  render_views
  before(:all) do
    truncate_all_tables
    load_foundation_cache
    @user = User.gen
    @collection = Collection.gen
    @collection.users<<@user
    EOL::Solr::CollectionItemsCoreRebuilder.begin_rebuild
  end

  describe 'GET show' do
    it 'should set view as options and currently selected view' 

    describe '#login_with_open_authentication' do
      it 'should do nothing unless oauth_provider param is present' 

      it 'should redirect to login unless user already logged in' 

      it 'should redirect to current url if it matches the session return to url and clear obsolete session data' 

    end
  end

  describe 'GET edit' do
    it 'should set view as options' 

  end

  describe "#update" do
    it "When not logged in, users cannot update the description" 

    it "Unauthorized users cannot update the description" 

    it "Updates the description" 


  end
end

