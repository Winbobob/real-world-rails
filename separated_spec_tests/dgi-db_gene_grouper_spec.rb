require 'spec_helper'

describe Genome::Groupers::GeneGrouper do

  def create_entrez_gene_aliases
    entrez_source = Fabricate(:source, source_db_name: 'Entrez')
    gene_claims = (1..3).map { Fabricate(:gene_claim, source: entrez_source) }
    gene_claims.each do |gene_claim|
      Fabricate(:gene_claim_alias, gene_claim: gene_claim, nomenclature: 'Gene Symbol')
    end
    gene_claims
  end

  it 'should add the gene claim if the gene claim name matches the gene name (case insensitive)' 


  it 'should add the gene claim if a gene claim alias matches the gene name (case insensitive)' 


  it 'should add the gene claim if its name matches another grouped gene claim' 


  it 'should add gene attributes' 


  it 'should add gene categories' 


end

