require File.dirname(__FILE__) + '/../spec_helper'

describe ObservationsController do
  describe "create" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    let(:user) { User.make! }
    before do
      sign_in user
    end
    it "should not raise an exception if the obs was invalid and an image was submitted"
    
    it "should not raise an exception if no observations passed" 

    
    it "should add project observations if auto join project specified" 


    it "should add project observations to elasticsearch" 


    it "should add project observations if auto join project specified and format is json" 

    
    it "should set taxon from taxon_name param" 

    
    it "should set the site" 


    it "should survive submitting an invalid observation to a project" 


    it "should work with a custom coordinate system" 


    it "should mark the observation as reviewed by the observer if there was a taxon" 


  end
  
  describe "update" do
    it "should not raise an exception if no observations passed" 

    
    it "should use latitude param even if private_latitude set" 


    describe "with captive_flag" do
      let(:o) { Observation.make! }
      before do
        sign_in o.user
      end
      it "should set captive" 

      it "should set a quality_metric" 

    end

    describe "license changes" do
      let(:u) { User.make! }
      let(:past_o) { Observation.make!(user: u, license: nil) }
      let(:o) { Observation.make!(user: u, license: nil) }
      before do
        expect( u.preferred_observation_license ).to be_nil
        expect( past_o.license ).to be_nil
        expect( o.license ).to be_nil
        sign_in u
      end
      it "should update the license of the observation" 

      it "should update user default" 

      it "should update past licenses" 

    end
  end

  describe "show" do
    it "should not include the place_guess when coordinates obscured" 

    it "should 404 for absurdly large ids" 

  end
  
  describe "import_photos" do
    # to test this we need to mock a flickr response
    it "should import photos that are already entered as taxon photos"
  end

  describe "by_login_all", "page cache" do
    before do
      @observation = Observation.make!
      @user = @observation.user
      path = observations_by_login_all_path(@user.login, :format => 'csv')
      FileUtils.rm private_page_cache_path(path), :force => true
      sign_in @user
    end

    it "should set after request" 


    it "should be cleared by new observations" 

  end

  describe "project" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    render_views

    describe "viewed by project curator" do
      let(:p) { Project.make! }
      let(:pu) { ProjectUser.make!(:project => p, :role => ProjectUser::CURATOR) }
      let(:u) { pu.user }
      before do
        sign_in u
      end

      it "should include private coordinates" 


      it "should not include private coordinates if observer is not a member" 


      it "should not include private coordinates if observer does not prefer it" 

    end

    it "should not include private coordinates when viewed by a normal project member" 

  end

  describe "project_all", "page cache" do
    before do
      @project = Project.make!
      @user = @project.user
      @observation = Observation.make!(:user => @user)
      @project_observation = make_project_observation(:project => @project, :observation => @observation, :user => @observation.user)
      @observation = @project_observation.observation
      ActionController::Base.perform_caching = true
      path = all_project_observations_path(@project, :format => 'csv')
      FileUtils.rm private_page_cache_path(path), :force => true
      sign_in @user
    end

    after do
      ActionController::Base.perform_caching = false
    end

    it "should set after request" 


    it "should be cleared by new observations" 

    describe "when viewed by a project curator" do
      before do
        @project.curators << @user
        expect( @project ).to be_curated_by @user
      end
      it "should include private coordinates for observations with geoprivacy" 


      it "should include private coordinates for observations of threatened taxa" 

    end
  end

  describe "by_login_all" do
    it "should include observation fields" 

  end

  describe "project_all", "csv" do
    it "should include observation fields" 


    it "should have project-specific fields" 


    it "should have private coordinates for curators" 


    it "should not have private_coordinates when curator_coordinate_access is false" 

  end

  describe "curation" do
    render_views
    before :each do
      @curator = make_curator
      http_login(@curator)
    end

    it "should render a link to the flagger" 


    it "should show site.site_name_short if there is no flagger" 

  end

  describe "index" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    render_views
    it "should just ignore project slugs for projects that don't exist" 


    it "should include https image urls in widget response" 

  end

  describe "review" do
    let(:obs_to_review) { Observation.make! }
    it "forces users to log in when requesting HTML" 

    it "denies non-logged-in users when requesting JSON" 

    it "allows logged-in requests" 

    it "redirects HTML requests to the observations page" 

    it "creates an observation review if one does not exist" 

    it "updates an existing observation review" 

  end

end

describe ObservationsController, "spam" do
  let(:spammer_content) {
    o = Observation.make!
    o.user.update_attributes(spammer: true)
    o
  }
  let(:flagged_content) {
    o = Observation.make!
    Flag.make!(flaggable: o, flag: Flag::SPAM)
    o
  }

  it "should render 403 when the owner is a spammer" 


  it "should render 403 when content is flagged as spam" 

end

describe ObservationsController, "new_batch" do
  describe "routes" do
    before do
      sign_in User.make!
    end
    it "should accept GET requests" 

    it "should accept POST requests" 

  end
end

describe ObservationsController, "new_bulk_csv" do
  let(:work_path) { File.join(Dir::tmpdir, "new_bulk_csv-#{Time.now.to_i}.csv") }
  let(:headers) do
    %w(taxon_name date_observed description place_name latitude longitude tags geoprivacy)
  end
  let(:user) { User.make! }
  before do
    sign_in user
  end
  it "should not allow you to enqueue the same file twice" 


  it "should allow you to enqueue different files" 


  it "should create observations" 


  it "should create observations with custom coordinate systems" 

end

