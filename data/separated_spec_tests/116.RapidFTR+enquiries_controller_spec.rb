require 'spec_helper'

def inject_export_generator(fake_export_generator, enquiry_data)
  allow(ExportGenerator).to receive(:new).with(enquiry_data).and_return(fake_export_generator)
end

def stub_out_export_generator(enquiry_data = [])
  inject_export_generator(stub_export_generator = double(ExportGenerator), enquiry_data)
  allow(stub_export_generator).to receive(:child_photos).and_return('')
  stub_export_generator
end

def stub_out_enquiry_get(mock_enquiry = double(Enquiry))
  allow(Enquiry).to receive(:get).and_return(mock_enquiry)
  mock_enquiry
end

describe EnquiriesController, :type => :controller do

  before :each do
    SystemVariable.all.each { |variable| variable.destroy }
  end

  describe '#index', :solr => true do
    before :each do
      Sunspot.remove_all!
    end

    shared_examples_for 'viewing enquiries by user with access to all data' do
      describe 'when the signed in user has access all data' do
        before do
          role = create :role, :permissions => [Permission::ENQUIRIES[:create]]
          user = create :user, :role_ids => [role.id]
          @session = setup_session user
          @params ||= {}
          @params.merge!(:filter => @filter) if @filter
          @expected_enquiry ||= [create(:enquiry, :created_by => @session.user_name)]
        end

        it 'should assign all enquiries as @enquiries' 

      end
    end

    shared_examples_for 'viewing enquiries as a field worker' do
      describe 'when the signed in user is a field worker' do
        before do
          @session ||= fake_field_worker_login
          @params ||= {}
          @params.merge!(:filter => @filter) if @filter
          @expected_enquiries ||= [create(:enquiry, :created_by => @session.user_name)]
        end

        it 'should assign the enquiries created by the user as @enquiries' 

      end
    end

    context 'viewing reunited enquiries' do
      context 'admin' do
        before do
          @field_worker = create :user
          create(:enquiry, :created_by => @field_worker.user_name)
          @expected_enquiries = [create(:enquiry, :created_by => @field_worker.user_name, :reunited => true)]
          @filter = 'reunited'
        end
        it_should_behave_like 'viewing enquiries by user with access to all data'
      end
      context 'field worker' do
        before do
          @session = fake_field_worker_login
          create(:enquiry, :created_by => @session.user_name)
          @expected_enquiries = [create(:enquiry, :created_by => @session.user_name, :reunited => true)]
          @filter = 'reunited'
        end
        it_should_behave_like 'viewing enquiries as a field worker'
      end
    end

    context 'viewing enquiries with matches' do
      context 'admin' do
        before do
          @field_worker = create :user
          create(:enquiry, :created_by => @field_worker.user_name)
          expected_enquiry = create(:enquiry, :created_by => @field_worker.user_name, :flag => true)
          PotentialMatch.create(:enquiry_id => expected_enquiry.id, :child_id => '1')
          expected_enquiry.reload
          expected_enquiry.save
          @expected_enquiries = [expected_enquiry]
          @filter = 'has_matches'
        end
        it_should_behave_like 'viewing enquiries by user with access to all data'
      end
      context 'field_worker' do
        before do
          @session = fake_field_worker_login
          create(:enquiry, :created_by => @session.user_name)
          expected_enquiry = create(:enquiry, :created_by => @session.user_name, :flag => true)
          PotentialMatch.create(:enquiry_id => expected_enquiry.id, :child_id => '1')
          expected_enquiry.reload
          expected_enquiry.save
          @expected_enquiries = [expected_enquiry]
          @filter = 'has_matches'
        end
        it_should_behave_like 'viewing enquiries as a field worker'
      end
    end

    context 'viewing enquiries with confirmed matches' do
      context 'admin' do
        before do
          @field_worker = create :user
          create(:enquiry, :created_by => @field_worker.user_name)
          unexpected_enquiry = create(:enquiry, :created_by => @field_worker.user_name, :flag => true)
          PotentialMatch.create(:enquiry_id => unexpected_enquiry.id, :child_id => '1')
          unexpected_enquiry.reload
          unexpected_enquiry.save
          expected_enquiry = create(:enquiry, :created_by => @field_worker.user_name, :flag => true)
          PotentialMatch.create(:enquiry_id => expected_enquiry.id, :child_id => '1', :status => PotentialMatch::CONFIRMED)
          expected_enquiry.reload
          expected_enquiry.save
          @expected_enquiries = [expected_enquiry]
          @filter = 'has_confirmed_match'
        end
        it_should_behave_like 'viewing enquiries by user with access to all data'
      end
      context 'field worker' do
        before { @options = {:startkey => %w(active fakefieldworker), :endkey => ['active', 'fakefieldworker', {}], :page => 1, :per_page => 20, :view_name => :by_all_view_with_created_by_created_at} }
        it_should_behave_like 'viewing enquiries as a field worker'
      end
    end

    context 'viewing enquiries when they are turned off' do

      before :each do
        @session = fake_field_worker_login
        SystemVariable.create!(:name => SystemVariable::SCORE_THRESHOLD, :type => 'number', :value => '0.00')
        SystemVariable.create!(:name => SystemVariable::ENABLE_ENQUIRIES, :type => 'boolean', :value => '0')
      end

      it 'should return 404 when enquiries are turned off' 

    end
  end

  describe '#new' do

    before :each do
      reset_couchdb!
      @session = fake_field_worker_login
      SystemVariable.create(:name => SystemVariable::SCORE_THRESHOLD, :type => 'number', :value => '0.00')
      SystemVariable.create(:name => SystemVariable::ENABLE_ENQUIRIES, :type => 'boolean', :value => '1')
    end

    it 'should render new form' 


    it 'should assign the form' 

  end

  describe '#create' do

    before :each do
      reset_couchdb!
      @session = fake_field_worker_login
      SystemVariable.create(:name => SystemVariable::SCORE_THRESHOLD, :type => 'number', :value => '0.00')
      SystemVariable.create(:name => SystemVariable::ENABLE_ENQUIRIES, :type => 'boolean', :value => '1')
    end

    before :each do
      field1 = build(:field, :name => 'enquirer_name')
      field2 = build(:field, :name => 'child_name')
      field3 = build(:photo_field, :name => 'photo')
      field4 = build(:audio_field, :name => 'audio')

      form = create(:form, :name => Enquiry::FORM_NAME)
      create(:form_section, :name => 'enquiry_criteria', :form => form, :fields => [field1, field2, field3, field4])
    end

    it 'should fail if user is not authorized to create enquiry' 


    it 'should return to the new enquiry page' 


    it 'should save a new enquiry in the database' 


    it 'should add a created_by field to the enquiry' 


    it 'should redirect to enquiry show page' 


    describe 'photos and audio' do
      before :each do
        @photo_jeff  = Rack::Test::UploadedFile.new(Rails.root + 'features/resources/jeff.png', 'image/png')
        @photo_jorge = Rack::Test::UploadedFile.new(Rails.root + 'features/resources/jorge.jpg', 'image/jpg')
        @audio = Rack::Test::UploadedFile.new(Rails.root + 'features/resources/sample.mp3', 'audio/mp3')

        @enquiry = {
          'enquirer_name' => 'John Doe',
          'child_name' => 'Kasozi'
        }
      end

      it 'should save a photo along with the enquiry' 


      it 'should save multiple photos along with the enquiry' 


      it 'should save an audio attachment along with the enquiry' 


      it 'should save a single photo and audio file along with the enquiry' 


      it 'should save multiple photos and an audio file along with the enquiry' 

    end
  end

  describe '#show' do

    before :each do
      reset_couchdb!
      @session = fake_field_worker_login
      SystemVariable.create(:name => SystemVariable::SCORE_THRESHOLD, :type => 'number', :value => '0.00')
      SystemVariable.create(:name => SystemVariable::ENABLE_ENQUIRIES, :type => 'boolean', :value => '1')
    end

    before :each do
      field1 = build :field, :name => 'enquirer_name'
      field2 = build :field, :name => 'child_name'
      field3 = build :photo_field, :name => 'photo'
      form = create :form, :name => Enquiry::FORM_NAME
      @form_section = create :form_section, :name => 'enquiry_criteria', :form => form, :fields => [field1, field2, field3]
      @enquiry = create :enquiry, :created_by => @session.user_name, :photo => uploadable_photo
    end

    it 'should not show enquiry if user has no permission to view enquiry' 


    it 'should show an enquiry if the user has permissions to view enquiry' 

  end

  describe '#update enquiry', :solr => true do

    before :each do
      reset_couchdb!
      @session = fake_field_worker_login
      SystemVariable.create(:name => SystemVariable::SCORE_THRESHOLD, :type => 'number', :value => '0.00')
      SystemVariable.create(:name => SystemVariable::ENABLE_ENQUIRIES, :type => 'boolean', :value => '1')
    end

    before :each do
      Sunspot.setup(Child) do
        text :child_name
        text :location
        text :gender
      end
      @child = create(:child, :child_name => 'any child', :location => 'Kampala', :gender => 'male')
      form = create(:form, :name => Enquiry::FORM_NAME)
      enquirer_name_field = build(:text_field, :name => 'enquirer_name')
      child_name_field = build(:text_field, :name => 'child_name')
      gender_field = build(:text_field, :name => 'gender')
      location_field = build(:text_field, :name => 'location')
      photo_field = build(:photo_field, :name => 'photo')
      audio_field = build(:audio_field, :name => 'audio')
      @form_section = create(:form_section, :name => 'enquiry_criteria', :form => form, :fields => [enquirer_name_field, child_name_field, location_field, gender_field, photo_field, audio_field])
      @enquiry = create(:enquiry, :enquirer_name => 'John doe', :child_name => 'any child', :gender => 'male', :location => 'kampala', :photo => uploadable_photo, :audio => uploadable_audio_mp3)
      allow(controller.current_ability).to receive(:can?).with(:update, Enquiry).and_return(true)
    end

    describe '#edit' do

      it 'should render edit template' 


      it 'should load an enquiry' 


      it 'load form sections for the enquiry form' 

    end

    describe '#update' do
      it 'should not change enquiry given empty params' 


      it 'should update the attributes of an enquiry' 


      it 'should redirect to show page after succcessful update' 


      it 'should return to edit page after unsuccessful update' 


      describe 'photos and audio' do
        it 'should not change the photo and audio after updating an enquiry' 

      end
    end
  end

  describe '#respond_to_export' do
    before :each do
      fake_admin_login
      @enquiry1 = build :enquiry
      @enquiry2 = build :enquiry
      results = [@enquiry1, @enquiry2]
      allow_any_instance_of(Search).to receive(:results).and_return(results)
    end

    it 'should handle full PDF' 


    it 'should handle Photowall PDF' 


    it 'should handle CSV' 


    it 'should handle custom export addon' 


    it 'should encrypt result' 


    it 'should generate filename based on enquiry ID and addon ID when there is only one enquiry' 


    it 'should generate filename based on username and addon ID when there are multiple enquiries' 


    it 'should handle CSV' 


  end
end
