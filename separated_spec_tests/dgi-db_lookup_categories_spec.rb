require 'spec_helper'

describe LookupCategories do
  describe '::find_genes_for_category_and_sources' do

    it 'should find all genes for the given category and sources' 


    it 'should only find unique genes' 


    it 'should only find genes in the selected category' 


    it 'should only find genes in the selected source' 

  end

  describe '::get_category_names_with_counts_with_sources' do
    it 'should return both the category names and the correct count of gene claims in that category' 

  end

  describe '::gene_names_in_category' do
    def setup_category
      category = Fabricate(:gene_claim_category, name: 'TESTCATEGORY')
      gene = Fabricate(:gene, gene_categories: [category])
      [gene, category.name]
    end

    it 'should return gene names in the given category' 


    it 'should be case insensitive' 


    it 'should not return gene names that are not in the category' 


  end
end

