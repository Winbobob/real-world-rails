# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminPublicBodyController do

  describe 'GET #index' do

    it "returns successfully" 


    it "searches for 'humpa'" 


    it "searches for 'humpa' in another locale" 


  end

  describe 'GET #show' do
    let(:public_body){ FactoryGirl.create(:public_body) }
    let(:info_request){ FactoryGirl.create(:info_request,
                                           :public_body => public_body) }
    let(:admin_user){ FactoryGirl.create(:admin_user) }
    let(:pro_admin_user){ FactoryGirl.create(:pro_admin_user) }

    it "returns successfully" 


    it "sets a using_admin flag" 


    it "shows a public body in another locale" 


    it 'does not include embargoed requests if the current user is
        not a pro admin user' do
      info_request.create_embargo
      get :show, { :id => public_body.id }, { :user_id => admin_user.id }
      expect(assigns[:info_requests].include?(info_request)).to be false
    end

    context 'when pro is enabled' do

      it 'does not include embargoed requests if the current user is
          not a pro admin user' do
        with_feature_enabled(:alaveteli_pro) do
          info_request.create_embargo
          get :show, { :id => public_body.id }, { :user_id => admin_user.id }
          expect(assigns[:info_requests].include?(info_request)).to be false
        end
      end


      it 'includes embargoed requests if the current user is a pro admin
          user' do
        with_feature_enabled(:alaveteli_pro) do
          info_request.create_embargo
          get :show, { :id => public_body.id }, { :user_id => pro_admin_user.id }
          expect(assigns[:info_requests].include?(info_request)).to be true
        end
      end
    end

  end

  describe 'GET #new' do

    it 'responds successfully' 


    it 'should assign a new public body to the view' 


    it "builds new translations for all locales" 


    it 'renders the new template' 


    context 'when passed a change request id as a param' do
      render_views

      it 'should populate the name, email address and last edit comment on the public body' 


      it 'should assign a default response text to the view' 


    end

  end

  describe "POST #create" do

    context 'on success' do

      before(:each) do
        @params = { :public_body => { :name => 'New Quango',
                                      :short_name => 'nq',
                                      :request_email => 'newquango@localhost',
                                      :tag_string => 'spec',
                                      :last_edit_comment => 'From test code' } }
      end

      it 'creates a new body in the default locale' 


      it 'can create a public body when the default locale is an underscore locale' 


      it 'notifies the admin that the body was created' 


      it 'redirects to the admin page of the body' 


    end

    context 'on success for multiple locales' do

      before(:each) do
        @params = { :public_body => { :name => 'New Quango',
                                      :short_name => 'nq',
                                      :request_email => 'newquango@localhost',
                                      :tag_string => 'spec',
                                      :last_edit_comment => 'From test code',
                                      :translations_attributes => {
                                        'es' => { :locale => 'es',
                                                  :name => 'Los Quango',
                                                  :short_name => 'lq' }
        } } }
      end

      it 'saves the body' 


      it 'saves the default locale translation' 


      it 'saves the alternative locale translation' 


    end

    context 'on failure' do

      it 'renders the form if creating the record was unsuccessful' 


      it 'is rebuilt with the given params' 


    end

    context 'on failure for multiple locales' do

      before(:each) do
        @params = { :public_body => { :name => '',
                                      :request_email => 'newquango@localhost',
                                      :translations_attributes => {
                                        'es' => { :locale => 'es',
                                                  :name => 'Los Quango' }
        } } }
      end

      it 'is rebuilt with the default locale translation' 


      it 'is rebuilt with the alternative locale translation' 


    end

    context 'when the body is being created as a result of a change request' do

      before do
        @change_request = FactoryGirl.create(:add_body_request)
        post :create, { :public_body => { :name => "New Quango",
                                          :short_name => "",
                                          :tag_string => "blah",
                                          :request_email => 'newquango@localhost',
                                          :last_edit_comment => 'From test code' },
                        :change_request_id => @change_request.id,
                        :subject => 'Adding a new body',
                        :response => 'The URL will be [Authority URL will be inserted here]'}
      end

      it 'should send a response to the requesting user' 


      it 'should mark the change request as closed' 


    end

  end

  describe "GET #edit" do

    before do
      @body = FactoryGirl.create(:public_body)
      AlaveteliLocalization.with_locale('es') do
        @body.name = 'Los Body'
        @body.save!
      end
    end

    it 'responds successfully' 


    it 'finds the requested body' 


    it 'builds new translations if the body does not already have a translation in the specified locale' 


    it 'renders the edit template' 


    it "edits a public body in another locale" 


    context 'when the body has info requests' do

      render_views

      it 'does not show the form for destroying the body' 


    end

    context 'when the body does not have info requests' do

      render_views

      it 'shows the form for destroying the body' 


    end

    context 'when passed a change request id as a param' do
      render_views

      before do
        @change_request = FactoryGirl.create(:update_body_request)
        get :edit, :id => @change_request.public_body_id,  :change_request_id => @change_request.id
      end

      it 'should populate the email address and last edit comment on the public body' 


      it 'should assign a default response text to the view' 

    end

  end

  describe "POST #update" do

    before do
      @body = FactoryGirl.create(:public_body)
      AlaveteliLocalization.with_locale('es') do
        @body.name = 'Los Quango'
        @body.save!
      end

      @params = { :id => @body.id,
                  :public_body => { :name => 'Renamed',
                                    :short_name => @body.short_name,
                                    :request_email => @body.request_email,
                                    :tag_string => @body.tag_string,
                                    :last_edit_comment => 'From test code',
                                    :translations_attributes => {
                                      'es' => { :id => @body.translation_for(:es).id,
                                                :locale => 'es',
                                                :title => @body.name(:es) }
      } } }
    end

    it 'finds the heading to update' 


    context 'on success' do

      it 'saves edits to a public body heading' 


      it 'notifies the admin that the body was updated' 


      it 'redirects to the admin body page' 


    end

    context 'on success for multiple locales' do

      it 'saves edits to a public body heading in another locale' 


      it 'adds a new translation' 


      it 'creates a new translation for the default locale' 


      it 'adds new translations' 


      it 'updates an existing translation and adds a third translation' 


    end

    context 'on failure' do

      it 'renders the form if creating the record was unsuccessful' 


      it 'is rebuilt with the given params' 


    end

    context 'on failure for multiple locales' do

      before(:each) do
        @params = { :id => @body.id,
                    :public_body => { :name => '',
                                      :translations_attributes => {
                                        'es' => { :id => @body.translation_for(:es).id,
                                                  :locale => 'es',
                                                  :name => 'Mi Nuevo Body' }
        } } }
      end

      it 'is rebuilt with the default locale translation' 


      it 'is rebuilt with the alternative locale translation' 


    end

    context 'when the body is being updated as a result of a change request' do

      before do
        @change_request = FactoryGirl.create(:update_body_request)
        post :update, { :id => @change_request.public_body_id,
                        :public_body => { :name => "New Quango",
                                          :short_name => "",
                                          :request_email => 'newquango@localhost',
                                          :last_edit_comment => 'From test code' },
                        :change_request_id => @change_request.id,
                        :subject => 'Body update',
                        :response => 'Done.'}
      end

      it 'should send a response to the requesting user' 


      it 'should mark the change request as closed' 


    end
  end

  describe "POST #destroy" do

    it "does not destroy a public body that has associated requests" 


    it "destroys a public body" 


  end


  describe "POST #mass_tag_add" do

    it "mass assigns tags" 

  end

  describe "GET #import_csv" do

    describe 'when handling a GET request' do

      it 'should get the page successfully' 


    end

    describe 'when handling a POST request' do

      before do
        allow(PublicBody).to receive(:import_csv).and_return([[],[]])
        @file_object = fixture_file_upload('/files/fake-authority-type.csv')
      end

      it 'should handle a nil csv file param' 


      describe 'if there is a csv file param' do

        it 'should try to get the contents and original name of a csv file param' 


        it 'should assign the original filename to the view' 


      end

      describe 'if there is no csv file param, but there are temporary_csv_file and
                    original_csv_file params' do

        it 'should try and get the file contents from a temporary file whose name
                  is passed as a param' do
          expect(@controller).to receive(:retrieve_csv_data).with('csv_upload-2046-12-31-394')
          post :import_csv, { :temporary_csv_file => 'csv_upload-2046-12-31-394',
                              :original_csv_file => 'original_contents.txt',
                              :commit => 'Dry run'}
        end

        it 'should raise an error on an invalid temp file name' 


        it 'should raise an error if the temp file does not exist' 


        it 'should assign the temporary filename to the view' 


      end
    end
  end

  describe "when administering public bodies and paying attention to authentication" do

    before do
      config = MySociety::Config.load_default
      config['SKIP_ADMIN_AUTH'] = false
      basic_auth_login @request
    end

    after do
      config = MySociety::Config.load_default
      config['SKIP_ADMIN_AUTH'] = true
    end

    def setup_emergency_credentials(username, password)
      config = MySociety::Config.load_default
      config['SKIP_ADMIN_AUTH'] = false
      config['ADMIN_USERNAME'] = username
      config['ADMIN_PASSWORD'] = password
      @request.env["HTTP_AUTHORIZATION"] = ""
    end

    it "disallows non-authenticated users to do anything" 


    it "skips admin authorisation when SKIP_ADMIN_AUTH set" 


    it "doesn't let people with bad emergency account credentials log in" 


    it "allows people with good emergency account credentials log in using HTTP Basic Auth" 


    it "doesn't let people with good emergency account credentials log in if the emergency user is disabled" 


    it "allows superusers to do stuff" 


    it "doesn't allow non-superusers to do stuff" 


    describe 'when asked for the admin current user' do

      it 'returns the emergency account name for someone who logged in with the emergency account' 


      it 'returns the current user url_name for a superuser' 


      it 'returns the REMOTE_USER value from the request environment when skipping admin auth' 


    end
  end
end

