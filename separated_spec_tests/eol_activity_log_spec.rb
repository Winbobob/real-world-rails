require "spec_helper"

class NewKindOfThing ; end

# TODO - There's a lot I'm not testing, here, because I don't believe the Solr syntax *belongs* in this class. We
# could, of course, actually check the string being passed to #search_with_pagination ... but that just strikes me as
# *incredibly* brittle... and exposes a bit of a bad smell about the class being tested.
#
# As is, we test the other responsibilities of the class *reasonably* well, besides, so I'm not entirely upset.
# Exceptions are noted below as TODOs. ...Also, this spec file runs ridiculously fast. ...There's one slow spec and
# I'm not sure which it is, though I hear it thrashing disk. ...I wonder if it's just loading FactoryGirl. (?)
describe EOL::ActivityLog do

  before(:all) do
    @default_options = { per_page: 20, page: 1 }
  end

  before do
    allow(EOL::Solr::ActivityLog).to receive(:search_with_pagination)
  end

  it '#global should delegate to #find with nil source' 


  it '#global should deafult to $ACTIVITIES_ON_HOME_PAGE per_page' 


  it '#find should delegate to EOL::Solr::ActivityLog.global_activities(options) with nil source' 


  it '#find should delegate to EOL::Solr::ActivityLog#search_with_pagination for RecentActivitiesController' 


  it '#find should delegate to EOL::Solr::ActivityLog#search_with_pagination for User' 


  it '#find should delegate to EOL::Solr::ActivityLog#search_with_pagination for Community' 


  it '#find should delegate to EOL::Solr::ActivityLog#search_with_pagination for Collection' 


  it '#find should delegate to EOL::Solr::ActivityLog#search_with_pagination for DataObject' 


  it '#find should delegate to EOL::Solr::ActivityLog#search_with_pagination for TaxonConcept' 


  it '#find should delegate to ...#search_with_pagination with reasonable defaults for other classes' 


  it '#find should follow supercedure for TaxonConcepts' 


  # Yeah, right... like we're going to test this easily:
  it 'should only follow 500 supercedure ids'

  # Brittle test... but this is a bad smell; the code is sloppy.
  it '#find should limit data object ids to 500' 


  it '#find should at least look at the focuses for communities (we trust it is searching on them as well)' 


  # I don't want to test this here; too tightly coupled with the actual Solr query.
  it '#find should handle several filters (all, messages, community, collections, watchlist, curation) for user news'

  # I don't want to test this here; too tightly coupled with the actual Solr query.
  it '#find should allow a date to search after for user news'

  # I don't want to test this here; too tightly coupled with the actual Solr query.
  it '#find should handle several filters (comments, taxa_comments, data_object_curation, names, added_data_objects,
  collections, communities) for user activities'

  # We *could* check these, but it would be super-brittle (and I don't know why we use #include? here anyway, this
  # would be clearer with a #case):
  it 'should handle a comments filter for recent activities'
  it 'should handle a data_object_curation filter for recent activities'
  it 'should handle a names filter for recent activities'
  it 'should handle a added_data_objects filter for recent activities'
  it 'should handle a collections filter for recent activities'
  it 'should handle a communities for recent activities'

end

