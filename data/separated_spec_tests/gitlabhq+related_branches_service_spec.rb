require 'spec_helper'

describe Issues::RelatedBranchesService do
  let(:user) { create(:admin) }
  let(:issue) { create(:issue) }

  subject { described_class.new(issue.project, user) }

  describe '#execute' do
    before do
      allow(issue.project.repository).to receive(:branch_names).and_return(["mpempe", "#{issue.iid}mepmep", issue.to_branch_name, "#{issue.iid}-branch"])
    end

    it "selects the right branches when there are no referenced merge requests" 


    it "selects the right branches when there is a referenced merge request" 


    it 'excludes stable branches from the related branches' 

  end
end

