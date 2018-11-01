require 'spec_helper'

describe ProtectedBranchPolicy do
  let(:user) { create(:user) }
  let(:name) { 'feature' }
  let(:protected_branch) { create(:protected_branch, name: name) }
  let(:project) { protected_branch.project }

  subject { described_class.new(user, protected_branch) }

  it 'branches can be updated via project maintainers' 


  it "branches can't be updated by guests" 

end

