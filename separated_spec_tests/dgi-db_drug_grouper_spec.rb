require 'spec_helper'

describe Genome::Groupers::DrugGrouper do

  def group
    grouper = Genome::Groupers::DrugGrouper.new
    grouper.run
    grouper
  end

  it 'should add the drug claim if the drug claim name matches the drug name (case insensitive)' 


  it 'should add the drug claim if a drug claim alias matches the drug name (case insensitive)' 


  it 'should add the drug claim if its name matches another grouped drug claim' 


  it 'should add the drug claim if its alias matches another grouped drug claim alias' 


  it 'should not add the drug claim if its alias matches multiple drug aliases' 


  it 'should not add the drug claim if it matches multiple drug names' 


  it 'should not add the drug claim if it matches multiple molecule names' 


  it 'should not add the drug claim if its name or aliases match multiple molecule synonyms, unless from the same molecule' 


  it 'should not add more than one copy of an alias from a single drug claim' 


  it 'should add a drug if the drug claim matches a molecule, and add the drug claim to the drug' 


  it 'should properly update drug flags after grouping' 


  it 'should rename drug name from molecule pref_name if pref_name is not unique' 


  it 'should have the proper alias name loaded from molecule after grouping' 


  it 'should not attempt to create existing aliases from chembl molecule synonyms' 


  it 'should not allow drugs to have null names' 


  it 'should blacklist and remove common aliases' 


end

