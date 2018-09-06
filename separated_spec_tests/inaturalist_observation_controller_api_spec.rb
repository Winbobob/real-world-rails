require File.dirname(__FILE__) + '/../spec_helper'

shared_examples_for "ObservationsController basics" do

  describe "create" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    it "should create" 

    it "should not create for a suspended user" 

    it "should create for an unsuspended user" 

  end

  describe "destroy" do
    it "should destroy" 

  end

  describe "show" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    it "should not provide private coordinates for another user's observation" 

  end

  describe "update" do
    let( :o ) { Observation.make!( user: user ) }
    it "should update" 

  end
end

shared_examples_for "an ObservationsController" do

  describe "create" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }

    it "should create with an existing photo ID" 


    it "should include coordinates in create response when geoprivacy is obscured" 


    it "should include private coordinates in create response when geoprivacy is obscured" 


    it "should include private coordinates in create response when geoprivacy is private" 


    it "should not fail if species_guess is a question mark" 


    it "should accept nested observation_field_values" 


    it "should survive blank observation_field_values_attributes" 


    it "should allow Google Street View photos" 


    it "should not fail with a dot for a species_guess" 


    it "should handle invalid time zones" 


    describe "project_id" do
      let(:p) { Project.make! }

      it "should add to project" 


      it "should not create a project user if one doesn't exist" 


      it "should add to project with has_media rule if photo present" 


      it "should set the project_observation's user_id" 

    end

    it "should not duplicate observations with the same uuid" 


    it "should update attributes for an existing observation with the same uuid" 


    it "should be invalid for observations with the same uuid if the existing was by a differnet user" 


    it "should set the uuid even if it wasn't included in the request" 


    it "should not override a uuid in the request" 


    it "should default to using Site.default" 


    it "should accept other site_ids" 


    describe "with owners_identification_from_vision" do
      it "should set mark the owners identification as coming from vision" 

      it "should return the same attribute and value" 

    end

  end

  describe "destroy" do
    it "should not destory other people's observations" 

  end

  describe "show" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }

    it "should provide private coordinates for user's observation" 


    it "should not include photo metadata" 


    it "should include observation field values" 


    it "should include observation field values with observation field names" 


    it "should include comments" 


    it "should include comment user icons" 


    it "should include identifications" 


    it "should include identification user icons" 


    it "should include identification taxon icons" 


    it "should include identification taxon common name" 


    it "should include taxon rank level" 


    it "should include user name" 


    describe "faves" do
      let(:o) { Observation.make! }
      let(:voter) { User.make! }
      before do
        o.vote_by voter: voter, vote: true
      end
      it "should be included" 

      it "should have users with id, login, and icon" 

    end

    it "captive_flag should match observer's vote if true" 


    it "captive_flag should match observer's vote if false" 


    it "captive_flag should be false if observer hasn't voted" 


    it "should include project observations with project descriptions" 

  end

  describe "update" do
    before do
      @o = Observation.make!(:user => user)
    end

    it "should accept nested observation_field_values" 


    it "should updating existing observation_field_values" 


    it "should updating existing observation_field_values by observation_field_id" 


    it "should updating existing observation_field_values by observation_field_id even if they're project fields" 


    it "should allow removal of nested observation_field_values" 


    it "should respond with 410 for deleted observations" 


    it "should assume request lat/lon are the true coordinates" 


    it "should not change the true coordinates when switching to a threatened taxon and back" 


    it "should deal with updating the taxon_id" 


    it "shoudld remove the taxon when taxon_id is blank" 


    it "should mark as captive in response to captive_flag" 

    
    it "should mark as wild in response to captive_flag" 


    it "should remove place_guess when changing geoprivacy to private" 


    it "should return private coordinates if geoprivacy is private" 


    it "should return private coordinates if geoprivacy is obscured" 


    describe "private_place_guess" do
      let(:p) { make_place_with_geom( admin_level: Place::COUNTRY_LEVEL, name: "Freedonia" ) }
      let(:original_place_guess) { "super secret place" }
      let(:o) {
        Observation.make!(
          latitude: p.latitude,
          longitude: p.longitude,
          geoprivacy: Observation::OBSCURED,
          place_guess: original_place_guess,
          user: user
        )
      }
      it "should not change if the obscured place_guess is submitted" 

      it "should change with a new place_guess" 

      it "should not change when updating an observation of a threatened taxon" 

    end

    describe "existing photos" do
      let(:o) { make_research_grade_observation( user: user ) }
      it "should leave them alone if included" 

      it "should delete them if omitted" 

      it "should delete corresponding ObservationPhotos if omitted" 

    end

    describe "with owners_identification_from_vision" do
      let( :observation ) { Observation.make!( user: user, taxon: Taxon.make! ) }
      it "should update if requested and taxon changed" 

      it "should not update if requested and taxon did not changed" 

      it "should set the vision attribute on the corresponding identification if changed and taxon changed" 

    end
  end

  describe "by_login" do
    before(:each) { enable_elastic_indexing([ Observation ]) }
    after(:each) { disable_elastic_indexing([ Observation ]) }

    it "should get user's observations" 


    it "should allow filtering by updated_since" 


    it "should allow filtering by updated_since with positive offsets" 


    it "should return no results if updated_since is specified but incorrectly formatted" 


    it "should include deleted observation IDs when filtering by updated_since" 


    it "should not include deleted observation IDs by other people" 


    it "should return private observations for bounding box queries when viewer is owner" 


    it "should include private coordinates when viewer is owner" 


    it "should return names specific to the user's place" 

  end

  describe "index" do
    before(:each) { enable_elastic_indexing( Observation, Place, UpdateAction ) }
    after(:each) { disable_elastic_indexing( Observation, Place, UpdateAction ) }

    it "should allow search" 


    it "should allow sorting with different cases" 


    it "should filter by hour range" 


    it "should filter by date range" 


    it "should filter by time range" 


    it "should filter by month range" 


    it "should filter by week of the year" 


    it "should filter by multiple months" 


    it "should filter by captive=true" 


    it "should filter by captive=false" 


    it "should filter by captive when quality metrics used" 


    it "captive filter=false should include nil" 


    it "should include pagination data in headers" 


    it "should paginate" 


    it "should filter by min_id" 


    it "should filter by min_id and per_page" 


    it "should not include photo metadata" 


    it "should filter by conservation_status" 


    it "should filter by conservation_status authority" 


    it "should filter by establishment means" 


    describe "filtration by tag in elasticsearch" do
      after do
        tagged = Observation.make!(tag_list: @tag)
        not_tagged = Observation.make!
        get :index, format: :json, q: @tag, search_on: "tags"
        json = JSON.parse(response.body)
        expect( json.size ).to eq 1
        expect( json.detect{|obs| obs['id'] == tagged.id} ).not_to be_blank
      end
      it "should work" 

      it "with hyphen" 

      it "with colon" 

      it "with underscore" 

    end

    it "should filter by tag with an underscore in the database" 


    it "should include common names" 


    it "should include identifications_count" 


    it "should include comments_count" 


    it "should include faves_count" 


    it "should let you request project_observations as extra data" 


    it "should let you request observation field values as extra data" 


    it "should let you request observation_photos as extra data" 


    it "should let you request identifications as extra data" 


    it "should filter by list_id" 


    it "should not require sign in for page 100 or more" 


    it "should filter by taxon name" 


    it "should filter by taxon name regardless of case" 


    it "should filter by taxon name if there are synonyms and iconic_taxa provided" 


    it "should filter by multiple taxon ids" 


    it "should filter by place and multiple taxon ids" 


    it "should filter by mappable = true" 


    it "should filter by mappable = false" 


    it "should not filter by mappable when its nil" 


    it "should include place_guess" 


    it "should not include place_guess if coordinates obscured" 


    it "should filter by project slug" 


    it "should filter by project slug if it begins with a number" 


    it "should filter by observations not in a project" 


    it "should filter by identified" 


    it "should filter by not identified" 


    it "should allow limit" 


    it "filters on observation fields" 


    it "filters created_on based on timezone in which it was created" 


    it "should filter by has[]=photos" 


    it "observations with no time_observed_at ignore time part of date filters" 


    describe "filtration by pcid" do
      let(:po1) { ProjectObservation.make! }
      let(:p) { po1.project }
      let(:pu) { ProjectUser.make!(project: p, role: ProjectUser::CURATOR) }
      let(:o1) { po1.observation }
      let(:i) { Identification.make!(observation: o1, user: pu.user) }
      let(:po2) { ProjectObservation.make!(project: p) }
      let(:o2) { po2.observation }
      before do
        [o1, i, o2].each do |r|
          expect(r.id).not_to be_blank
        end
        Delayed::Worker.new(quiet: true).work_off
        [ o1, o2 ].map(&:reload)
        [ o1, o2 ].map(&:elastic_index!)
      end
      it "should filter by yes" 

      it "should filter by no" 

    end

    it "should sort by votes asc" 


    it "should sort by votes asc" 


    it "should sort by observed_on asc and respect time" 


    it "should sort by observed_on desc and respect time" 


    describe "filtration by license" do
      before do
        @all_rights = Observation.make!(license: nil)
        expect( @all_rights.license ).to be_nil
        @cc_by = Observation.make!(license: Observation::CC_BY)
      end
      it "should work for any" 

      it "should work for none" 

      it "should work for CC-BY" 

    end

    describe "filtration by photo_license" do
      before do
        @all_rights = Observation.make!
        photo = LocalPhoto.make!
        make_observation_photo(photo: photo, observation: @all_rights)
        @cc_by = Observation.make!(license: Observation::CC_BY)
        photo = LocalPhoto.make!(license: Photo::CC_BY)
        make_observation_photo(photo: photo, observation: @cc_by)
      end
      it "should work for any" 

      it "should work for none" 

      it "should work for CC-BY" 

    end

    describe "with site" do
      let(:site) { Site.default( refresh: true ) }
      it "should filter by place" 

      it "should filter by site_only_observations" 

      it "should filter by bounding box" 


      it "should filter by bounding box if place_id set" 

    end

    describe "should filter when quality_grade" do
      before do
        @research_grade = make_research_grade_observation
        @needs_id = make_research_grade_candidate_observation
        @casual = Observation.make!
      end
      it "research" 

      it "needs_id" 

      it "casual" 

      it "research,needs_id" 

    end

    describe "Simple DarwinCore format" do
      render_views
      it "should render results" 

    end

    describe "csv" do
      render_views
      it "should render" 

    end

    describe "HTML format" do
      render_views
      before{ @o = make_research_grade_observation }
      it "should show the angular app" 


      it "can render a partial instead" 

    end
  end

  describe "taxon_stats" do
    before(:each) { enable_elastic_indexing( Observation, Place ) }
    after(:each) { disable_elastic_indexing( Observation, Place ) }
    before do
      @o = Observation.make!(:observed_on_string => "2013-07-20", :taxon => Taxon.make!(:rank => Taxon::SPECIES))
      get :taxon_stats, :format => :json, :on => "2013-07-20"
      @json = JSON.parse(response.body)
    end

    it "should include a total" 


    it "should include species_counts" 


    it "should include rank_counts" 

  end

  describe "user_stats" do
    before(:each) { enable_elastic_indexing( Observation, Place ) }
    after(:each) { disable_elastic_indexing( Observation, Place ) }
    before do
      @o = Observation.make!(
        observed_on_string: "2013-07-20",
        taxon: Taxon.make!( rank: Taxon::SPECIES )
      )
      get :user_stats, format: :json, on: "2013-07-20"
      @json = JSON.parse( response.body )
    end

    it "should include a total" 


    it "should include most_observations" 


    it "should include most_species" 


    it "should include user name" 

  end

  describe "viewed_updates" do
    before do
      enable_elastic_indexing(UpdateAction)
      after_delayed_job_finishes do
        @o = Observation.make!(:user => user)
        @c = Comment.make!(:parent => @o)
        @i = Identification.make!(:observation => @o)
      end
    end
    after(:each) { disable_elastic_indexing(UpdateAction) }

    it "should mark all updates from this observation for the signed in user as viewed" 


    it "should not mark other updates for the signed in user as viewed" 


    it "should not mark other updates from this observation as viewed" 

  end

  describe "project" do
    before(:each) { enable_elastic_indexing([ Observation ]) }
    after(:each) { disable_elastic_indexing([ Observation ]) }

    it "should allow filtering by updated_since" 

  end

  describe "update_fields" do
    before(:each) { enable_elastic_indexing( Observation ) }
    after(:each) { disable_elastic_indexing( Observation ) }
    shared_examples_for "it allows changes" do
      it "should allow ofv creation" 

      it "should allow ofv updating" 

    end

    describe "for the observer" do
      let(:o) { Observation.make!(:user => user) }
      let(:of) { ObservationField.make! }
      it_behaves_like "it allows changes"
      it "should add to a project when project_id included" 

      it "adds the project observation to elasticsearch" 

    end

    describe "for a non-observer" do
      let(:o) { Observation.make! }
      let(:of) { ObservationField.make! }
      it_behaves_like "it allows changes"
      it "should set the user_id" 

    end

    describe "for a curator" do
      before do
        user.roles << Role.make!(:name => "curator")
      end
      let(:o) { Observation.make! }
      let(:of) { ObservationField.make! }

      it "should allow creation if observer prefers editng by curators" 

      it "should not allow creation if observer prefers editng by observer" 

    end
  end

  describe "review" do
    let(:o) { Observation.make! }
    it "should mark an observation as reviewed by the current user" 

    describe "should unreview" do
      before do
        ObservationReview.make!( observation: o, user: user )
        o.reload
        expect( o ).to be_reviewed_by user
      end
      it "should unreview in response to a param" 

      it "should unreview in response to DELETE" 

    end
  end
end

describe ObservationsController, "oauth authentication" do
  let(:user) { User.make! }
  before do
    token = Doorkeeper::AccessToken.create(
      application: OauthApplication.make!,
      resource_owner_id: user.id,
      scopes: Doorkeeper.configuration.default_scopes
    )
    request.env["HTTP_AUTHORIZATION"] = "Bearer #{token.token}"
  end
  it_behaves_like "ObservationsController basics"
  it_behaves_like "an ObservationsController"
end

describe ObservationsController, "oauth authentication with param" do
  before(:each) { enable_elastic_indexing( Observation ) }
  after(:each) { disable_elastic_indexing( Observation ) }

  let(:user) { User.make! }
  
  it "should create" 

end

describe ObservationsController, "devise authentication" do
  let(:user) { User.make! }
  before do
    http_login(user)
  end
  it_behaves_like "ObservationsController basics"
end

describe ObservationsController, "jwt authentication" do
  let(:user) { User.make! }
  before do
    request.env["HTTP_AUTHORIZATION"] = JsonWebToken.encode(user_id: user.id)
  end
  it_behaves_like "ObservationsController basics"
end

describe ObservationsController, "jwt bearer authentication" do
  let(:user) { User.make! }
  before do
    request.env["HTTP_AUTHORIZATION"] = "Bearer #{JsonWebToken.encode(user_id: user.id)}"
  end
  it_behaves_like "ObservationsController basics"
end

describe ObservationsController, "without authentication" do
  describe "index" do
    before(:each) { enable_elastic_indexing([ Observation ]) }
    after(:each) { disable_elastic_indexing([ Observation ]) }
    it "should require sign in for page 100 or more" 

  end
  describe "create" do
    it "should be impossible" 

  end
end

