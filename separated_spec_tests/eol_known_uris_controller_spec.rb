require "spec_helper"

def create_known_uri(params)
  new_instance = KnownUri.create(uri: params[:uri], uri_type_id: params[:uri_type_id],
    vetted_id: Vetted.trusted.id, visibility_id: Visibility.visible.id)
  TranslatedKnownUri.create(known_uri: new_instance, name: params[:name], language: Language.english)
  new_instance
end

def expect_measurement_types
  EOL::Sparql.connection.should_receive(:all_measurement_type_known_uris).at_least(1).times.and_return(KnownUri.measurements)
end

def expect_no_measurement_types
  EOL::Sparql.connection.should_receive(:all_measurement_type_known_uris).at_least(1).times.and_return([])
end


# TODO - this isn't a controller spec, it's a feature spec. Move it.
describe KnownUrisController do

  before(:all) do
    load_foundation_cache
    @user = User.gen
    @user.grant_permission(:see_data)
    @full = FactoryGirl.create(:curator)
    @full.grant_permission(:see_data)
    @master = FactoryGirl.create(:master_curator)
    @master.grant_permission(:see_data)
    @admin = User.gen(:admin => true)
    @admin.grant_permission(:see_data)
    # creating some allowed units for Mass
    @mass = KnownUri.gen_if_not_exists({ uri: Rails.configuration.uri_term_prefix + 'mass', name: 'Mass', uri_type_id: UriType.measurement.id })
    @length = KnownUri.gen_if_not_exists({ uri: Rails.configuration.uri_term_prefix + 'length', name: 'Length', uri_type_id: UriType.measurement.id })
    @sex = KnownUri.find_by_translated(:name, 'Sex')
    @male = KnownUri.find_by_translated(:name, 'Male')
    @female = KnownUri.find_by_translated(:name, 'Female')
    @source = KnownUri.find_by_translated(:name, 'Source')
    [ KnownUri.milligrams, KnownUri.grams, KnownUri.kilograms ].each do |unit|
      KnownUriRelationship.gen(from_known_uri: @mass, to_known_uri: unit,
        relationship_uri: KnownUriRelationship::ALLOWED_UNIT_URI)
    end
  end

  before(:each) do
    session[:user_id] = @user.id
  end

  describe 'GET index' do
    it 'should work for admins' 


    it 'should work for master curators' 


    it 'should deny access for full curators' 


    it 'should deny access for users with data privilege' 


    it 'should deny access to normal or non-logged-in users' 

  end

  describe 'GET autocomplete_known_uri_search' do

    it 'should allow access to users with data privilege' 


    # the method allows an empty search, but the JS will only call this method when there are at least 2 characters
    it 'should not return any KnownUris without a search term by default' 


    # the method allows an empty search, but the JS will only call this method when there are at least 2 characters
    it 'should return matching KnownUris based on search term' 


    it 'should return nothing when there is no match' 

  end

  describe 'GET autocomplete_known_uri_predicates' do

    it 'should allow access to users with data privilege' 


    # the method allows an empty search, but the JS will only call this method when there are at least 2 characters
    it 'should return all measurements when there is no term' 


    it 'should allow searches within measurements' 


    it 'should only return results for valid measurements' 


  end

  describe 'GET autocomplete_known_uri_units' do

    it 'should allow access to users with data privilege' 


    it 'should return all visible units when there is no term and no predicate' 


    it 'should return a list of visible allowed units when given a predicate' 


    it 'should allow searches within units' 


    it 'should still allow searches given a predicate, but the predicate will be ignored' 

  end

  describe 'GET autocomplete_known_uri_metadata' do

    it 'should allow access to users with data privilege' 


    it 'should return all visible metadata URIs when there is no term' 


    it 'should allow searches within metadata' 


    it 'should be able to search for non-visible metadata' 


    it 'should not return UnitOfMeasure if supplied predicate has specified units' 

  end

  describe 'GET autocomplete_known_uri_values' do

    it 'should allow access to users with data privilege' 


    it 'should return global matches when there is no predicate' 


    it 'should return a list of visible allowed values when given a predicate' 


    it 'should allow searches within values' 


    it 'should be able to search for non-visible metadata' 

  end

end

