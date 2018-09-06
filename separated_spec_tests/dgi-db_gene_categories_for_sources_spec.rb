require 'spec_helper'

describe 'gene_categories_for_sources' do
  def setup_categories_and_genes
    category = Fabricate(:gene_claim_category)
    source = Fabricate(:source)
    gene = Fabricate(:gene)
    gene_claim = Fabricate(:gene_claim, source: source, gene_claim_categories: [category], gene: gene)
    [category, source, gene_claim, gene]
  end

  it 'should return a list of json hashes that contain category names and gene counts' 


  it 'should only return categories in requested_sources' 

end

