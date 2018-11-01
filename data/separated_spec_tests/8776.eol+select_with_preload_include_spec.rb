require "spec_helper"

describe 'Select with Preload Include' do
  before :all do
    load_foundation_cache
    @taxon_concept = build_taxon_concept(:comments => [], :toc => [], :bhl => [], :images => [], :sounds => [])
    @last_hierarchy_entry = HierarchyEntry.last
    @last_data_object = DataObject.last
    @last_agent = Agent.last
    @last_user = User.last
    @last_user_info = UserInfo.gen(user: @last_user)
    @last_user.user_info = @last_user_info
    @dohe = DataObjectsHarvestEvent.last
    ContentPartner.gen(user: @last_user)
  end

  it 'should be able to select .*' 


  it 'should be able to select using a hash of symbols' 


  it 'should default select fields to primary table' 


  it 'should ONLY grab fields from a table specificed in :select (:has_one)' 


  it 'should ONLY grab fields from a table specificed in :select (:belongs_to)' 


  it 'should be able to select from a composite key belongs_to association' 


  it 'should NOT fail on a misspelled table name' 


  it 'SHOULD fail on a misspelled field name' 




  it 'should be able to select from a belongs_to association' 


  it 'should be able to select from a belongs_to => has_many association' 



  it 'should be able to select from a has_one association' 


  it 'should be able to select from a has_one => belongs_to association' 



  it 'should be able to select from a has_many association' 


  it 'should be able to select from a has_many through association' 


  it 'should be able to select from a has_and_belongs_to_many association' 


  it 'should be able to select from nested has_and_belongs_to_many associations' 


  it 'should be able to select from crazy long association chains' 

end

