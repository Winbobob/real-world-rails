require 'spec_helper'

describe 'interactions' do
  def setup_interactions
    source = Fabricate(:source, source_db_name: 'TALC')
    Fabricate(:interaction, gene_name: 'FLT1', source: source)
    Fabricate(:interaction, gene_name: 'MM1', source: source)
  end

  it 'should load example URL with a valid 200 status code' 

end

describe 'all interactions' do
  def setup_interactions
    (1..3).map do |i|
      Fabricate(:interaction)
    end
  end

  it 'should load example URL with a valid 200 status code' 

end

describe 'interaction details' do
  def setup_interaction
    Fabricate(:interaction)
  end

  it 'should load example URL with a valid 200 status code' 

end

