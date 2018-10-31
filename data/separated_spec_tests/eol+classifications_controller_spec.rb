require File.dirname(__FILE__) + '/../spec_helper'

describe ClassificationsController do

  before(:all) do
   # load_scenario_with_caching :foundation
    # truncate_all_tables
    Language.create_english    
    Visibility.create_enumerated
    CuratorLevel.create_enumerated
    Vetted.create_enumerated
    DataType.create_enumerated
    SpecialCollection.create_enumerated
    ChangeableObjectType.create_enumerated
    Activity.create_enumerated
    @taxon_concept = TaxonConcept.gen # Doesn't need to *do* anything special.
    @hierarchy_entry = HierarchyEntry.gen # Again, can be "dumb".
    @curator = User.gen(:credentials => 'awesome', :curator_scope => 'life')
    @curator.grant_curator(:full)    
  end

  before(:each) do
    TaxonConceptPreferredEntry.delete_all
    CuratedTaxonConceptPreferredEntry.delete_all("taxon_concept_id = #{@taxon_concept.id}")
  end

  # TODO - this is written as a feature spec.

  it 'should work, dammit' 


  it 'should update an existing tcpe' 


  it 'should do nothing if you are NOT a curator' 


end

