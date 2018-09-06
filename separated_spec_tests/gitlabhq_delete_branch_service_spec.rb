require 'spec_helper'

describe DeleteBranchService do
  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:user) { create(:user) }
  let(:service) { described_class.new(project, user) }

  describe '#execute' do
    context 'when user has access to push to repository' do
      before do
        project.add_developer(user)
      end

      it 'removes the branch' 

    end

    context 'when user does not have access to push to repository' do
      it 'does not remove branch' 

    end
  end

  def branch_exists?(branch_name)
    repository.ref_exists?("refs/heads/#{branch_name}")
  end
end

