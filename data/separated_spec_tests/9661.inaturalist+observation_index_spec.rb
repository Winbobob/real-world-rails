require "spec_helper"

describe "Observation Index" do
  before( :all ) do
    @starting_time_zone = Time.zone
    Time.zone = ActiveSupport::TimeZone["Samoa"]
    load_test_taxa
  end
  after( :all ) { Time.zone = @starting_time_zone }
  before(:each) { enable_elastic_indexing( Observation ) }
  after(:each) { disable_elastic_indexing( Observation ) }

  it "as_indexed_json should return a hash" 


  it "sets location based on private coordinates if exist" 


  it "sets location based on public coordinates if there are no private" 


  it "indexes created_at based on observation time zone" 


  it "indexes created_at_details based on observation time zone" 


  it "sorts photos by position and ID" 


  it "includes observation photo ID" 


  it "uses private_latitude/longitude to create private_geojson" 


  it "sets taxon globally threatened" 


  it "sets taxon threatened in a place" 


  it "sets taxon introduced" 


  it "sets taxon native" 


  it "sets taxon endemic" 


  it "indexes identifications" 


  it "indexes owners_identification_from_vision" 


  it "indexes applications based on user agent" 


  it "private_place_ids should include places that contain the positional_accuracy" 

  it "private_place_ids should not include places that do not contain the positional_accuracy" 

  it "private_place_ids should include places that do not contain the positional_accuracy but are county-level" 


  describe "place_ids" do
    it "should include places that contain the uncertainty cell" 

    it "should not include places that do not contain the uncertainty cell" 

    it "should include county-level places that do not contain the uncertainty cell" 

  end

  describe "params_to_elastic_query" do
    it "returns nil when ES can't handle the params" 


    it "filters by project rules" 


    it "filters by list taxa" 


    it "doesn't apply a site filter unless the site wants one" 


    it "queries names" 


    it "queries tags" 


    it "queries descriptions" 


    it "queries places" 


    it "queries all fields by default" 


    it "filters by param values" 


    it "filters by boolean params" 


    it "filters by presence of attributes" 


    it "filters by verifiable true" 


    it "filters by verifiable false" 


    it "filters by site_id" 


    it "filters by site place" 


    it "filters by site bounding box" 


    it "filters by user and user_id" 


    it "filters by taxon_id" 


    it "filters by taxon_ids" 


    it "filters by license" 


    it "filters by photo license" 


    it "filters by created_on year" 


    it "filters by created_on year and month" 


    it "filters by created_on year and month and day" 


    it "filters by project" 


    it "filters by pcid with a specified project" 


    it "filters by pcid" 


    it "filters by not_in_project" 


    it "filters by lrank" 


    it "filters by hrank" 


    it "filters by lrank and hrank" 


    it "filters by quality_grade" 


    it "filters by identifications" 


    it "filters by bounding box" 


    it "filters by lat and lng" 


    it "filters by reviewed" 


    it "filters by d1 d2 dates" 


    it "defaults d2 date to now" 


    it "defaults d1 date to 1800" 


    it "filters by d1 d2 datetimes" 


    it "defaults d2 date to now" 


    it "defaults d1 date to 1800" 


    it "respects d1 d2 timezones" 


    it "filters by h1 and h2" 


    it "filters by m1 and m2" 


    it "filters by updated_since" 


    it "filters by updated_since OR aggregation_user_ids" 


    it "filters by observation field values" 


    it "filters by conservation status" 


    it "filters by IUCN conservation status" 


    it "filters by conservation status authority" 


    it "filters by iconic_taxa" 


    it "filters by geoprivacy" 


    it "filters by popular" 


    it "filters by min_id" 


  end

  describe "prepare_batch_for_index" do
    it "should always include country-, state-, and county-level place IDs" 

    it "should have no place IDs when geoprivacy is private" 

    it "should have no place IDs when the taxon has a conservation status with private geoprivacy" 

  end
end

