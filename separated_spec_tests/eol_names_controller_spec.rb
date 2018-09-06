require File.dirname(__FILE__) + '/../../spec_helper'

describe Taxa::NamesController do

  before(:all) do
    load_foundation_cache
    @testy = {}
    @testy[:taxon_concept] =  build_taxon_concept(images: [], toc: [], sname: [], comments: [],
                              flash: [], sounds: [], bhl: [], biomedical_terms: nil)
    @testy[:curator] = build_curator(@testy[:taxon_concept] )
    common_name = Faker::Eol.common_name.firstcap + 'tsty'
    @testy[:taxon_concept].add_common_name_synonym(
      "testy_common_name", agent: @testy[:curator].agent, language: Language.english)
  end

  shared_examples_for 'taxa/names controller' do
    it 'should instantiate section for assistive header' 

    it 'should instantiate the taxon concept' 

  end


  describe 'GET related_names' do # default related names
    before :each do
      get :related_names, :taxon_id => @testy[:taxon_concept].id
    end
    it_should_behave_like 'taxa/names controller'
    it 'should instantiate related names' 

  end

  describe 'POST names' do

    before :each do
      session[:user_id] = @testy[:curator].id
      @approved_languages = Language.approved_languages.collect{|l| l.id}
    end

    # TODO - the rest of the specs here could be replaced in this block (and then this context could be removed), but ensure that there are good model specs
    # before you do that:
    context 'properly mocked' do

      let(:curator) { build_stubbed(User) }
      let(:synonym) { build_stubbed(Synonym) }
      let(:taxon_concept) { build_stubbed(TaxonConcept, id: 3542) }
      let(:titles) { TaxonConcept.with_titles }

      subject do
        post :create, name: { synonym: { language_id: Language.default.id }, string: 'woofer' },
                      commit_add_common_name: 'Add name', taxon_id: taxon_concept.id
      end

      before(:each) do
        # Not the best way to accomplish this, but:
        allow(TaxonConcept).to receive(:find) { taxon_concept }
        allow(TaxonConcept).to receive(:with_titles) {taxon_concept}
        allow(titles).to receive(:find){ taxon_concept }
        allow(controller).to receive(:current_user) { curator }
        allow(controller).to receive(:log_action) { curator }
        allow(controller).to receive(:expire_taxa) { curator }
        allow(curator).to receive(:is_curator?) { true }
        allow(curator).to receive(:agent) { build_stubbed(Agent) }
        allow(curator).to receive(:add_agent) { }
        allow(taxon_concept).to receive(:reindex_in_solr) { }
        allow(taxon_concept).to receive(:add_common_name_synonym) { synonym }
        allow(synonym).to receive(:errors) { [] }
      end

      it 'does NOT add agents to users who have one' 


      it 'adds an agent to users who do NOT have one' 


      it 'logs the action' 


      it 'expires taxon' 


      it 'does not flash an error' 


      it 'does NOT log or expire when there are errors' 


    end

    it 'should add a new common name in approved languages' 


    it 'should add a new common name in non-approved languages' 


  end

  describe 'GET common_names' do
    before :each do
      get :common_names, :taxon_id => @testy[:taxon_concept].id
    end
    it_should_behave_like 'taxa/names controller'
    it 'should instantiate common names' 

  end

  describe 'GET synonyms' do
    before :each do
      get :synonyms, :taxon_id => @testy[:taxon_concept].id
    end
    it_should_behave_like 'taxa/names controller'
    it 'should preload synonym associations' 


  describe 'GET delete' do
    it 'can be deleted only by the user that added the name' 

  end

  end

end

