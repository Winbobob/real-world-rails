require "spec_helper"

#TODO: test connection with Solr: filter, sort, total results, paging, etc

def it_should_collect_item(collectable_item_path, collectable_item)
  visit collectable_item_path
  click_link 'Add to a collection'
  if current_url.match /#{login_url}/
    page.fill_in 'session_username_or_email', with: @anon_user.username
    page.fill_in 'session_password', with: 'password'
    click_button 'Sign in'
    continue_collect(@anon_user, collectable_item_path)
    visit logout_url
  else
    continue_collect(@user, collectable_item_path)
  end
end

# TODO - errr... you have heard of yield and block-passing, right?
def continue_collect(user, url)
  current_url.should match /#{choose_collect_target_collections_path}/
  check 'collection_id_'
  begin
    click_button 'Collect item'
  rescue EOL::Exceptions::InvalidCollectionItemType
    # TODO - ...We're expecing this, I hope?
  end
  # TODO
  # current_url.should match /#{url}/
  # body.should include('added to collection')
  # user.watch_collection.items.map {|li| li.collected_item }.include?(collectable_item).should be_true
end

def it_should_create_and_collect_item(collectable_item_path, collectable_item)
  visit collectable_item_path
  click_link 'Add to a collection'
  if current_url.match /#{login_url}/
    page.fill_in 'session_username_or_email', with: @anon_user.username
    page.fill_in 'session_password', with: 'password'
    click_button 'Sign in'
    continue_create_and_collect(@anon_user, collectable_item_path)
    visit logout_url
  else
    continue_create_and_collect(@user, collectable_item_path)
  end
end

def continue_create_and_collect(user, url)
  current_url.should match /#{choose_collect_target_collections_path}/
  click_button 'Create collection'
  body.should have_tag(".collection_name_error", text: "Collection name can't be blank")
  fill_in 'collection_name', with: "#{user.username}'s new collection"
  click_button 'Create collection'
  body.should_not have_tag(".collection_name_error", text: "Collection name can't be blank")
end

describe "Collections" do
  before(:all) do

    unless User.find_by_username('collections_scenario')
      truncate_all_tables
      load_foundation_cache
      # load_scenario_with_caching(:collections)
    end

    Capybara.reset_sessions!
    collections = {}
    collections[:taxon_concept_1] = build_taxon_concept(images: [{},{}], sname: [], comments: [],
     flash: [], sounds: [], toc: [], bhl: [], biomedical_terms: nil)
    collections[:taxon_concept_2] = build_taxon_concept(images: [{},{}], sname: [], comments: [],
     flash: [], sounds: [], toc: [], bhl: [], biomedical_terms: nil)
    collections[:user] = User.gen
    collections[:collection] = Collection.gen
    collections[:collection].users = [collections[:user]]
    collections[:collection_oldest] = Collection.gen(:created_at => collections[:collection].created_at - 86400)
    collections[:collection_oldest].users = [collections[:user]]
    collections[:data_object] = DataObject.last
    collections[:taxon_concept] = build_taxon_concept(images: [{}])
    collections[:collection].add(collections[:data_object])
    @test_data = collections
    @collectable_collection = Collection.gen
    @collection = @test_data[:collection]
    @collection_owner = @test_data[:user]
    @collection_name = @collection.name
    @user = nil
    @under_privileged_user = User.gen
    @anon_user = User.gen(password: 'password')
    @taxon = @test_data[:taxon_concept_1]
    @taxon_to_collect = @test_data[:taxon_concept_2]
    @collection.add(@taxon)
    EOL::Solr::CollectionItemsCoreRebuilder.begin_rebuild
  end

  # TODO - this was done wrong. The counts are not guarnteed to work independently of order.  I'm doing my best to sort
  # out the data beforehand, but really, we should create a bunch of scenarios in the collections scenario to account
  # for each of the required specs, and not muck with the data on the same taxon/collection each time.
  before(:each) do
    @collection.update_column(:published, true)
    @collection.update_column(:name, @collection_name)
    @collection.update_column(:view_style_id, ViewStyle.annotated.id)
  end

  describe '(Preview)' do

    it 'should show collection on the taxon collections page' 


    it 'should not show preview collections on the taxon page' 


    it 'should not show preview collections on the user profile page to normal users' 


    # See 9853360275ad5f3b673c4ba86379397d32efa805 if you want this back:
    # it 'should show resource preview collections on the user profile page to the owner'

    # TODO - there are multiple assertions here that should be grouped differently.
    it 'should show removed message when unpublished' 


  end

  describe "(normal)" do

    shared_examples_for 'collections all users' do
      it 'should be able to view a collection and its items' 


      it "should be able to sort a collection's items" 


      it "should be able to change the view of a collection" 


    end

    shared_examples_for 'collecting all users' do
      describe "should be able to collect" do
        it 'taxa' 

        it 'data objects' 

        it 'communities' 

        it 'collections, unless its their watch collection' 

        it 'users' 

      end
    end

    shared_examples_for 'creating collection and collecting all users' do
      describe "should be able to create collection and collect" do
        it 'taxa' 

        it 'data objects' 

        it 'communities' 

        it 'collections, unless its their watch collection' 

        it 'users' 

      end
    end

    # Make sure you are logged in prior to calling this shared example group
    shared_examples_for 'collection and collecting logged in user' do
      it_should_behave_like 'collections all users'
      it_should_behave_like 'collecting all users'
      it_should_behave_like 'creating collection and collecting all users'

      it 'should be able to select all collection items on the page' 


      it 'should be able to copy collection items to one of their existing collections' 


      it 'should be able to copy collection items to a new collection' 

    end

    describe 'anonymous users' do
      before(:all) do
        visit logout_url
      end
      subject { body }
      it_should_behave_like 'collections all users'
      it 'should not be able to select collection items' 

      it 'should not be able to copy collection items' 

      it 'should not be able to move collection items' 

      it 'should not be able to remove collection items' 

    end

    describe 'user without privileges' do
      before(:each) do
        @user = @under_privileged_user
        login_as @user
      end
      after(:all) { @user = nil }
      it_should_behave_like 'collections all users'
      it_should_behave_like 'collecting all users'
      it_should_behave_like 'creating collection and collecting all users'
      it 'should not be able to move collection items' 

      it 'should not be able to remove collection items' 

    end

    describe 'user with privileges' do
      before(:each) do
        @user = @collection_owner
        login_as @user
      end
      after(:all) { @user = nil }
      it_should_behave_like 'collections all users'
      it_should_behave_like 'collecting all users'
      it_should_behave_like 'creating collection and collecting all users'
      it 'should be able to move collection items'
      it 'should be able to remove collection items'
      it 'should be able to edit ordinary collection' 

      it 'should be able to edit ordinary collection item attributes (with JS off, need Cucumber tests for JS on)'
      it 'should be able to delete ordinary collections'
      it 'should not be able to delete special collections'
      it 'should not be able to edit watch collection name' 

    end

    it "should always link collected objects to their latest published versions" 


    it "collections should respect the max_items_per_page value of their ViewStyles and have appropriate rel link tags" 


    it 'collection newsfeed should have rel canonical link tag'
    it 'collection newsfeed should have prev and next link tags if relevant'
    it 'collection newsfeed should append page number to head title if relevant'
    it 'collection editors should have rel canonical link tag'
    it 'collection editors should not have prev and next link tags'

    # TODO - write this spec somewhere useful.
    # We don't gain much from testing this here. It's a rather specific test (user activity should not include watch
    # collection activities), it's very hard to test, it's very expensive to set up, and it's a waste of time.
    it 'should not index activity log in SOLR if the collection is watch collection'

  end

end

