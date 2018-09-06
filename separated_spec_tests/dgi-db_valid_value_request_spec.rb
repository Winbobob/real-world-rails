require 'spec_helper'

describe 'api endpoints that request valid enumerations' do
  def generate_data(type_name)
    (1..3).map { Fabricate(type_name) }
  end

  def check_data(path, compare_column, data)
    visit path
    expect(page.status_code).to eq(200)
    body = JSON.parse(page.body)
    expect(body).to be_an_instance_of(Array)
    expect(body.sort).to eq data.map(&compare_column).sort
  end

  describe 'gene_categories' do
    it 'should return a list of all current gene category names as json' 

  end

  describe 'drug_types' do
    it 'should return a list of all drug type names in the system as json' 

  end

  describe 'interaction_types' do
    it 'should return a list of all interaction type names in the system as json' 

  end

  describe 'interaction_sources' do
    it 'should return a list of all sources that provide interaction claims' 

  end

  describe 'source_trust_levels' do
    it 'should return a list of all source trust levels in the system as json' 

  end

end

