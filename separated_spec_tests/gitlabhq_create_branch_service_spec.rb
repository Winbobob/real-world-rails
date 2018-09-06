require 'spec_helper'

describe CreateBranchService do
  let(:user) { create(:user) }
  let(:service) { described_class.new(project, user) }

  describe '#execute' do
    context 'when repository is empty' do
      let(:project) { create(:project_empty_repo) }

      it 'creates master branch' 


      it 'creates my-feature branch' 

    end
  end
end

