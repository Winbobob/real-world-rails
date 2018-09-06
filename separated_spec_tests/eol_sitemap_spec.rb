require "spec_helper"
require "rake"

describe 'Sitemaps' do
  before(:all) do
    User.delete_all
    ContentPartnerStatus.create_enumerated
    Vetted.create_enumerated
    DataType.create_enumerated
    
    @objects_to_include = []
    @objects_to_exclude = []
    @objects_to_include << ContentPage.gen(page_name: 'test_page_active', active: true)
    @objects_to_exclude << ContentPage.gen(page_name: 'test_page_inavtive', active: false)
    @objects_to_include << Community.gen(published: true)
    @objects_to_exclude << Community.gen(published: false)
    @objects_to_include << Collection.gen(published: true)
    @objects_to_exclude << Collection.gen(published: false)
    @objects_to_include << ContentPartner.gen(is_public: true)
    @objects_to_exclude << ContentPartner.gen(is_public: false)
    @objects_to_include << User.gen(active: true)
    @objects_to_exclude << User.gen(active: false)
    @objects_to_exclude << User.gen(active: true, hidden: true)
    taxon_concept = TaxonConcept.gen(published: true, vetted_id: Vetted.trusted.id)
    @objects_to_include << taxon_concept
    @objects_to_exclude << TaxonConcept.gen(published: false, vetted_id: Vetted.trusted.id)
    @objects_to_exclude << TaxonConcept.gen(supercedure_id: taxon_concept.id, vetted_id: Vetted.trusted.id)
    
    @cc_license = License.gen(title: 'cc-by-sa 1.0', source_url: 'http://creativecommons.org/licenses/by-sa/1.0/')
    @non_cc_license = License.gen(title: 'not applicable', source_url: 'http://who.cares')
    # Needed for #show_rights_holder?
    License.gen(title: 'no known copyright restrictions', source_url: 'http://not.here.com')
    @published_image_cc_license = DataObject.gen(data_type: DataType.image, license: @cc_license, published: 1, object_cache_url: '201201190911111')
    @published_image_non_cc_license = DataObject.gen(data_type: DataType.image, license: @non_cc_license, published: 1, object_cache_url: '201201190922222')
    @unpublished_image = DataObject.gen(data_type: DataType.image, license: @cc_license, published: 0, object_cache_url: '201201190933333')
    
    @rake = Rake::Application.new
    Rake.application = @rake
    load Rails.root + 'lib/tasks/sitemap.rake'
    Rake::Task.define_task(:environment)
  end
  
  it 'should be able to create txt sitemaps' 

  
  it 'should be able to destroy sitemaps' 

  
  it 'should be able to create xml sitemaps' 

  
  # Following tests are for image sitemaps
  it 'should be able to create xml image sitemaps' 

  
  it 'should be able to destroy image sitemaps' 

  
  
end

def urls_for_object(object)
  # eol.org is hardcoded as the host in the library. I couldn't figure out a nice way
  # to get the current host from within a library or rake task
  # TODO - fix this. ...Probably by UN-hard-coding the eol.org bit.  :)
  urls = []
  if object.class == ContentPage
    urls << EOL::URLHelper.get_url('cms_page_url', object.page_name, host: 'eol.org')
  elsif object.class == Collection
    urls << EOL::URLHelper.get_url('collection_url', object.id, host: 'eol.org')
    urls << EOL::URLHelper.get_url('collection_newsfeed_url', object.id, host: 'eol.org')
  elsif object.class == Community
    urls << EOL::URLHelper.get_url('community_url', object.id, host: 'eol.org')
    urls << EOL::URLHelper.get_url('community_newsfeed_url', object.id, host: 'eol.org')
  elsif object.class == ContentPartner
    urls << EOL::URLHelper.get_url('content_partner_url', object.id, host: 'eol.org')
  elsif object.class == TaxonConcept
    urls << EOL::URLHelper.get_url('taxon_overview_url', object.id, host: 'eol.org')
  elsif object.class == User
    urls << EOL::URLHelper.get_url('user_url', object.id, host: 'eol.org')
    urls << EOL::URLHelper.get_url('user_newsfeed_url', object.id, host: 'eol.org')
    urls << EOL::URLHelper.get_url('user_activity_url', object.id, host: 'eol.org')
  end
  return urls
end

