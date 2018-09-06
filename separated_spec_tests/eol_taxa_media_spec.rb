require "spec_helper"

describe 'Taxa media' do

  before(:all) do
    load_foundation_cache
    images = []
    sounds = []
    youtube = []
    10.times { images << { :data_rating => 1 + rand(5), :source_url => 'http://photosynth.net/identifying/by/string/is/bad/change/me' } }
    2.times { sounds << { :data_rating => 1 + rand(5) } }
    2.times { youtube << { :data_rating => 1 + rand(5), :vetted => Vetted.unknown } }
    @taxon_concept = build_taxon_concept(:canonical_form => 'Copious picturesqus', :common_names => [ 'Snappy' ],
                                             :images => images, :sounds => sounds, :youtube => youtube, comments: [])
    @taxon_page = TaxonPage.new(@taxon_concept, EOL::AnonymousUser.new(Language.default))
    Capybara.reset_sessions!
    CuratorLevel.create_enumerated
    EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild
  end

  it 'should show the taxon header' 


  it 'should show a gallery of mixed media' 


end

