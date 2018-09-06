require 'spec_helper'

describe 'genes_in_category' do
  def setup_category_with_gene
    category = Fabricate(:gene_claim_category, name: 'TESTCATEGORY')
    gene = Fabricate(:gene, gene_categories: [category])
    [gene, category.name]
  end

  it 'should return a 200 status code when the category exists' 


  it 'should return a json array of genes in the category' 


  it 'should return a 404 status code when the category does not exist' 

end

