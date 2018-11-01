require 'ansi/code'

describe ProposalSearchQuery, elasticsearch: true do
  before do
    # analogous to DatabaseCleaner.start in spec/rails_helper
    refresh_index
  end

  describe '#execute' do
    it "raises custom error when Elasticsearch is not available" 


    it "raises custom error when we feed Elasticsearch faulty search syntax" 


    it "returns an empty list for no Proposals" 


    it "returns the Proposal when searching by ID" 


    it "returns the Proposal when searching by public_id" 


    it "can operate on an a relation" 


    it "returns an empty list for no matches" 


    context Ncr::WorkOrder do
      [:project_title, :description, :vendor].each do |attr_name|
        it "returns the Proposal when searching by the ##{attr_name}" 

      end

      it "returns the Proposal when searching ncr_organization by name" 


      it "returns the Proposal when searching approving_official by name" 

    end

    context Gsa18f::Procurement do
      [:product_name_and_description, :justification, :additional_info].each do |attr_name|
        it "returns the Proposal when searching by the ##{attr_name}" 

      end
    end

    it "returns the Proposals by rank, weighting id matches above all else" 

  end
end

def refresh_index
  if ENV["ES_DEBUG"]
    puts ANSI.blue{ "----------------------------- REFRESHING INDEX ---------------------------------" }
  end
  Proposal.__elasticsearch__.refresh_index!
end

def dump_index
  if ENV["ES_DEBUG"]
    puts ANSI.blue{ "----------------- DUMP INDEX ---------------------" }
    puts Proposal.search( "*" ).results.pretty_inspect
  end
end

