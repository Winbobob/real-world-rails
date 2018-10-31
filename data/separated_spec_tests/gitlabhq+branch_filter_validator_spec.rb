require 'spec_helper'

describe BranchFilterValidator do
  let(:validator) { described_class.new(attributes: [:push_events_branch_filter]) }
  let(:hook) { build(:project_hook) }

  describe '#validates_each' do
    it 'allows valid branch names' 


    it 'disallows bad branch names' 


    it 'allows wildcards' 


    it 'gets rid of whitespace' 


    # Branch names can be quite long but in practice aren't over 255 so 4000 should
    # be enough space for a list of branch names but we can increase if needed.
    it 'limits length to 4000 chars' 

  end
end

