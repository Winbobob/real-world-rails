require "spec_helper"

describe TaxonConceptExemplarImagesController do

  before(:all) do
    load_foundation_cache
    images = []
    10.times { images << { :data_rating => 1 + rand(5), :source_url => 'http://photosynth.net/identifying/by/string/is/bad/change/me' } }
    10.times { images << { :data_rating => 1 + rand(5), :vetted => Vetted.unknown } }
    10.times { images << { :data_rating => 1 + rand(5), :vetted => Vetted.untrusted } }
    10.times { images << { :data_rating => 1 + rand(5), :vetted => Vetted.inappropriate } }
    @taxon_concept = build_taxon_concept(:canonical_form => 'Copious picturesqus', :common_names => [ 'Snappy' ],
                                             :images => images, comments: [])
    EOL::Solr::DataObjectsCoreRebuilder.begin_rebuild
  end

  describe 'PUT set_as_exemplar' do
    it 'should not allow non-curators to set exemplar images' 

    
    it 'should set an image as exemplar' 

  end
end

