require 'spec_helper'

def inject_export_generator(fake_export_generator, child_data)
  allow(ExportGenerator).to receive(:new).with(child_data).and_return(fake_export_generator)
end

def stub_out_export_generator(child_data = [])
  inject_export_generator(stub_export_generator = double(ExportGenerator), child_data)
  allow(stub_export_generator).to receive(:child_photos).and_return('')
  stub_export_generator
end

def stub_out_child_get(mock_child = double(Child))
  allow(Child).to receive(:get).and_return(mock_child)
  mock_child
end

describe ChildrenController, :type => :controller do

  before :each do
    Sunspot.remove_all!
  end

  def mock_child(stubs = {})
    @mock_child ||= mock_model(Child, stubs).as_null_object
  end

  it 'GET reindex' 


  describe '#authorizations' do
    before :each do
      fake_admin_login
    end
    describe 'collection' do
      it 'GET index' 


      it 'GET new' 


      it 'POST create' 


    end

    describe 'member' do
      before :each do
        allow(User).to receive(:find_by_user_name).with('uname').and_return(double('user', :user_name => 'uname', :organisation => 'org'))
        @child = Child.create('last_known_location' => 'London', :short_id => 'short_id', :created_by => 'uname')
        @child_arg = hash_including('_id' => @child.id)
      end

      it 'GET show' 


      it 'PUT update' 


      it 'PUT edit_photo' 


      it 'PUT update_photo' 


      it 'PUT select_primary_photo' 


      it 'DELETE destroy' 

    end
  end

  describe 'GET index', :solr => true do

    shared_examples_for 'viewing children by user with access to all data' do
      describe 'when the signed in user has access all data' do
        before do
          role = create :role, :permissions => [Permission::CHILDREN[:view_and_search],
                                                Permission::CHILDREN[:register],
                                                Permission::CHILDREN[:edit]]
          user = create :user, :role_ids => [role.id]
          @session = setup_session user
          @params ||= {}
          @params.merge!(:filter => @filter) if @filter
          @expected_children ||= [create(:child, :created_by => @session.user_name)]
        end

        it 'should assign all children as @children' 

      end
    end

    shared_examples_for 'viewing children as a field worker' do
      describe 'when the signed in user is a field worker' do
        before do
          @session ||= fake_field_worker_login
          @params ||= {}
          @params.merge!(:filter => @filter) if @filter
          @expected_children ||= [create(:child, :created_by => @session.user_name)]
        end

        it 'should assign the children created by the user as @childrens' 

      end
    end

    context 'viewing all children' do
      context 'when filter is passed for admin' do
        before do
          @field_worker = create :user
          @expected_children = [create(:child, :created_by => @field_worker.user_name)]
          @filter = 'active'
        end
        it_should_behave_like 'viewing children by user with access to all data'
      end

      context 'when filter is passed for field worker' do
        before { @filter = 'active' }
        it_should_behave_like 'viewing children as a field worker'
      end

      context 'when filter is not passed admin' do
        before do
          @field_worker = create :user
          @filter = ''
          @expected_children = [create(:child, :created_by => @field_worker.user_name)]
        end
        it_should_behave_like 'viewing children by user with access to all data'
      end

      context 'when filter is not passed field_worker' do
        it_should_behave_like 'viewing children as a field worker'
      end

      context 'when filter is not passed field_worker and order is last_updated_at' do
        before { @params = {:order_by => 'last_updated_at'} }
        it_should_behave_like 'viewing children as a field worker'
      end

      context 'when status is not passed field_worker, order is last_updated_at and page is 2' do
        before { @session = fake_field_worker_login }
        before do
          create(:child, :created_by => @session.user_name)
          second_page_child = create(:child, :created_by => @session.user_name)
          @expected_children = [second_page_child]
        end
        before { @params = {:order_by => 'last_updated_at', :page => 2, :per_page => 1} }
        it_should_behave_like 'viewing children as a field worker'
      end
    end

    context 'when enquiries feature is turned off' do
      before { @session = fake_field_worker_login }
      before :each do
        SystemVariable.all.each { |variable| variable.destroy }
        SystemVariable.create!(:name => SystemVariable::ENABLE_ENQUIRIES, :type => 'boolean', :value => '0')
      end

      it 'should not include reunited_at in the system fields' 

    end

    context 'when enquiries feature is turned on' do
      before { @session = fake_field_worker_login }
      before :each do
        SystemVariable.all.each { |variable| variable.destroy }
        SystemVariable.create!(:name => SystemVariable::ENABLE_ENQUIRIES, :type => 'boolean', :value => '1')
      end

      it 'should include reunited_at in the system fields' 

    end

    context 'viewing reunited children' do
      context 'admin' do
        before do
          @field_worker = create :user
          create(:child, :created_by => @field_worker.user_name)
          @expected_children = [create(:child, :created_by => @field_worker.user_name, :reunited => true)]
          @filter = 'reunited'
        end
        it_should_behave_like 'viewing children by user with access to all data'
      end
      context 'field worker' do
        before do
          @session = fake_field_worker_login
          create(:child, :created_by => @session.user_name)
          @expected_children = [create(:child, :created_by => @session.user_name, :reunited => true)]
          @filter = 'reunited'
        end
        it_should_behave_like 'viewing children as a field worker'
      end
    end

    context 'viewing flagged children' do
      context 'admin' do
        before do
          @field_worker = create :user
          create(:child, :created_by => @field_worker.user_name)
          @expected_children = [create(:child, :created_by => @field_worker.user_name, :flag => true)]
          @filter = 'flag'
        end
        it_should_behave_like 'viewing children by user with access to all data'
      end
      context 'field_worker' do
        before do
          @session = fake_field_worker_login
          create(:child, :created_by => @session.user_name)
          @expected_children = [create(:child, :created_by => @session.user_name, :flag => true)]
          @filter = 'flag'
        end
        it_should_behave_like 'viewing children as a field worker'
      end
    end

    context 'viewing active children' do
      context 'admin' do
        before do
          @field_worker = create :user
          child1 = create(:child, :created_by => @field_worker.user_name)
          create(:child, :created_by => @field_worker.user_name, :duplicate => true, :duplicate_of => child1.id)
          @expected_children = [child1]
          @filter = 'active'
        end
        it_should_behave_like 'viewing children by user with access to all data'
      end
      context 'field worker' do
        before { @options = {:startkey => %w(active fakefieldworker), :endkey => ['active', 'fakefieldworker', {}], :page => 1, :per_page => 20, :view_name => :by_all_view_with_created_by_created_at} }
        it_should_behave_like 'viewing children as a field worker'
      end
    end

    describe 'export all to PDF/CSV/Photo Wall' do
      before do
        fake_field_admin_login
        @params ||= {}
        controller.stub :paginated_collection => [], :render => true
      end
      it 'should flash notice when exporting no records' 

    end

    describe 'order' do
      it 'should assign system fields for order by drop down' 


      it 'should assign form fields for order by drop down' 


      it 'should use the ascending sort order param' 


      it 'should use the descending sort order param' 


      it 'should assign the sort order' 

    end
  end

  describe 'GET show' do
    before :each do
      fake_admin_login
    end
    it 'does not assign child name in page name' 


    it 'assigns the requested child' 


    it 'should not fail if primary_photo_id is not present' 


    it 'should set current photo key as blank instead of nil' 


    it 'orders and assigns the forms' 


    it 'should flash an error and go to listing page if the resource is not found' 


    it 'should include duplicate records in the response' 

  end

  describe 'GET new' do
    before :each do
      fake_admin_login
    end
    it 'assigns a new child as @child' 


    it 'orders and assigns the forms' 

  end

  describe 'GET edit' do
    before :each do
      fake_admin_login
    end
    it 'assigns the requested child as @child' 


    it 'orders and assigns the forms' 

  end

  describe 'DELETE destroy' do
    before :each do
      fake_admin_login
    end
    it 'destroys the requested child' 


    it 'redirects to the children list' 

  end

  describe 'PUT update' do
    before :each do
      fake_admin_login
    end
    it 'should sanitize the parameters if the params are sent as string(params would be as a string hash when sent from mobile)' 


    it 'should update child on a field and photo update' 


    it 'should update only non-photo fields when no photo update' 


    it 'should not update history on photo rotation' 


    it 'should allow a records ID to be specified to create a new record with a known id' 


    it 'should update flag (cast as boolean) and flag message' 


    it 'should update history on flagging of record' 


    it 'should update the last_updated_by_full_name field with the logged in user full name' 


    it 'should not set photo if photo is not passed' 


    it 'should redirect to redirect_url if it is present in params' 


    it 'should redirect to child page if redirect_url is not present in params' 


  end

  describe 'exporting children' do
    class MockExportTask < RapidftrAddon::ExportTask
      def self.id
        :mock
      end
      def export(_children)
        []
      end
    end
    before :each do
      MockExportTask.enable
      Permission::CHILDREN.merge! :export_mock => 'Export to Mock'
      role = create :role, :permissions => Permission.all_permissions
      @user = create :user, :role_ids => [role.id]
      setup_session @user
      allow(controller).to receive(:authorize!).with(:export_mock, Child).and_return(Child)
      allow(controller).to receive(:authorize!).with(:index, Child).and_return(Child)
    end
    it 'should use #respond_to_export', :solr => true do
      child1 = create :child, :created_by => @user.user_name
      child2 = create :child, :created_by => @user.user_name
      expect_any_instance_of(MockExportTask).to receive(:export).with([child1, child2])
      get :index, :format => :mock
    end

    it 'should use #respond_to_export' 

  end

  describe '#respond_to_export' do
    before :each do
      fake_admin_login
      @child1 = build :child
      @child2 = build :child
      results = [@child1, @child2]
      allow_any_instance_of(Search).to receive(:results).and_return(results)
    end

    it 'should handle full PDF' 


    it 'should handle Photowall PDF' 


    it 'should handle CSV' 


    it 'should handle custom export addon' 


    it 'should encrypt result' 


    it 'should generate filename based on child ID and addon ID when there is only one child' 


    it 'should generate filename based on username and addon ID when there are multiple children' 


    it 'should handle CSV' 


  end

  describe 'PUT select_primary_photo' do
    before :each do
      fake_admin_login
      @child = stub_model(Child, :id => 'id')
      @photo_key = 'key'
      allow(@child).to receive(:primary_photo_id=)
      allow(@child).to receive(:save)
      allow(Child).to receive(:get).with('id').and_return @child
    end

    it 'set the primary photo on the child and save' 


    it 'should return success' 


    context 'when setting new primary photo id errors' do
      before :each do
        allow(@child).to receive(:primary_photo_id=).and_raise('error')
      end

      it 'should return error' 

    end
  end

  describe 'PUT create' do
    it 'should add the full user_name of the user who created the Child record' 

  end

  describe 'sync_unverified' do
    before :each do
      @user = build :user, :verified => false, :role_ids => []
      fake_login @user
    end

    it 'should mark all children created as verified/unverifid based on the user' 


    it 'should set the created_by name to that of the user matching the params' 


    it 'should update the child instead of creating new child everytime' 

  end

  describe 'POST create' do
    before :each do
      fake_admin_login
    end
    it 'should update the child record instead of creating if record already exists' 

  end

end

