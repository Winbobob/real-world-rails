require File.dirname(__FILE__) + '/../../spec_helper'

describe Taxa::MediaController do

  before(:all) do
    populate_tables(:data_types)
  end

  let(:taxon_concept) { TaxonConcept.gen }
  let(:user) { FactoryGirl.build_stubbed(User) }
  let(:taxon_page) { double(TaxonPage, scientific_name: 'Whatever somethingus', hierarchy_provider: "providedBy", preferred_scientific_name: "blahbalh") }
  let(:data_object_1) { FactoryGirl.build_stubbed(DataObject) }
  let(:data_object_2) { FactoryGirl.build_stubbed(DataObject) }
  let(:data_object_3) { FactoryGirl.build_stubbed(DataObject) }
  let(:taxon_media) { double(TaxonMedia, empty?: false, paginated: [data_object_1, data_object_2, data_object_3].paginate) }

  before do
    allow(controller).to receive(:current_user) { user }
    allow(TaxonPage).to receive(:new) { taxon_page }
    allow(taxon_page).to receive(:media) { taxon_media }
  end

  context 'with no media' do

    let(:taxon_media) { double(TaxonMedia, empty?: true, paginated: [].paginate) }

    before do
      allow(taxon_page).to receive(:media) { taxon_media }
    end

    it 'sets meta description as empty' 


  end

  it 'indicates pictures, video, and audio in meta description' 


  it 'should instantiate the taxon concept' 


  it 'should instantiate the taxon page' 


  it 'should instantiate a TaxonMedia object' 


  it 'should instantiate an assistive header' 


end

