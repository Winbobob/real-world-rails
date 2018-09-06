require "spec_helper"

describe 'Taxa worklist' do
  before(:all) do
    load_foundation_cache
    create_taxon_concept_with_media    
    Capybara.reset_sessions!
    CuratorLevel.create_enumerated
    @curator = build_curator(@taxon_concept) # build_curator generates a full curator by default.
    @user = User.gen()
    EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild
    @taxon_concept.images_from_solr(100).last.data_objects_hierarchy_entries.first.update_attributes(visibility_id: Visibility.invisible.id)
    @test_partner = ContentPartner.gen(display_name: 'Media Light Partner')
    @test_resource = Resource.gen(content_partner: @test_partner, title: 'Media Light Resource')
    hevt = HarvestEvent.gen(resource: @test_resource)
    image = @taxon_concept.images_from_solr.first
    DataObjectsHarvestEvent.connection.execute("UPDATE data_objects_harvest_events SET harvest_event_id=#{hevt.id} WHERE data_object_id=#{image.id}")
    DataObjectsHarvestEvent.connection.execute("COMMIT")
    EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild
  end
  
  def create_taxon_concept_with_media
    text = []
    images = []
    flash = []
    sounds = []
    youtube = []
    toc_items = [ TocItem.overview, TocItem.brief_summary]
    description = 'This is the text '
    10.times { images << { :data_rating => 1 + rand(5), :source_url => 'http://photosynth.net/identifying/by/string/is/bad/change/me' } }
    10.times { images << { :data_rating => 1 + rand(5), :vetted => Vetted.unknown } }
    10.times { images << { :data_rating => 1 + rand(5), :vetted => Vetted.untrusted } }
    10.times { images << { :data_rating => 1 + rand(5), :vetted => Vetted.inappropriate } }
    2.times { text << { :toc_item => toc_items.sample, :description => description + rand(100).to_s } }
    2.times { text << { :toc_item => toc_items.sample, :vetted => Vetted.unknown, :description => description + rand(100).to_s } }
    2.times { text << { :toc_item => toc_items.sample, :vetted => Vetted.untrusted, :description => description + rand(100).to_s } }
    2.times { text << { :toc_item => toc_items.sample, :vetted => Vetted.inappropriate, :description => description + rand(100).to_s } }
    2.times { flash << { :data_rating => 1 + rand(5) } }
    2.times { flash << { :data_rating => 1 + rand(5), :vetted => Vetted.unknown } }
    2.times { flash << { :data_rating => 1 + rand(5), :vetted => Vetted.untrusted } }
    2.times { flash << { :data_rating => 1 + rand(5), :vetted => Vetted.inappropriate } }
    2.times { sounds << { :data_rating => 1 + rand(5) } }
    2.times { sounds << { :data_rating => 1 + rand(5), :vetted => Vetted.unknown } }
    2.times { sounds << { :data_rating => 1 + rand(5), :vetted => Vetted.untrusted } }
    2.times { sounds << { :data_rating => 1 + rand(5), :vetted => Vetted.inappropriate } }
    2.times { youtube << { :data_rating => 1 + rand(5), :vetted => Vetted.unknown } }
    @taxon_concept = build_taxon_concept(:canonical_form => 'Copious picturesqus', :common_names => [ 'Snappy' ],
                                             :images => images, :flash => flash, :sounds => sounds, :youtube => youtube,
                                             :toc => text, comments: [])
  end
  
  after(:all) do
    truncate_all_tables
  end
  
  before(:each) do
    UsersDataObjectsRating.delete_all()
    login_as(@curator)
  end
  
  after(:each) do
    visit '/logout'
  end
  
  it 'should available only for curators' 

  
  it 'should show filters, tasks list and selected task' 

  
  it 'should show ratings, description, associations, revisions, source information sections selected task' 

  
  it 'should filter by data type' 

  
  it 'should filter by vetted status' 

  
  it 'should filter by visibility' 

  
  it 'should filter by resource' 

  
  it 'should be able to rate active task' 

  
  # it 'should be able to curate an association for the active task'
  # 
  # it 'should be able to add an association for the active task'

end

