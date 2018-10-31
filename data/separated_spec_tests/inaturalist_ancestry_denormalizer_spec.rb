require File.expand_path("../../../spec_helper", __FILE__)

describe 'AncestryDenormalizer' do

  before(:all) do
    Taxon.connection.execute('TRUNCATE TABLE taxa RESTART IDENTITY')
    last_taxon = nil
    # make six taxa, each the descendant of the previous taxon
    6.times do
      options = { }
      if last_taxon
        last_ancestry = "#{ last_taxon.ancestry }/#{ last_taxon.id }".gsub(/^\//, '')
        options = { parent_id: last_taxon.id, ancestry: last_ancestry }
      end
      last_taxon = Taxon.make!(options)
    end
  end

  after(:all) do
    Taxon.connection.execute('TRUNCATE TABLE taxa RESTART IDENTITY')
  end

  it 'should denormalize properly' 


  it 'should truncate the table' 


end

