require 'spec_helper'

describe RunnerEntity do
  let(:project) { create(:project) }
  let(:runner) { create(:ci_runner, :project, projects: [project]) }
  let(:entity) { described_class.new(runner, request: request, current_user: user) }
  let(:request) { double('request') }
  let(:user) { create(:admin) }

  before do
    allow(request).to receive(:current_user).and_return(user)
    allow(request).to receive(:project).and_return(project)
  end

  describe '#as_json' do
    subject { entity.as_json }

    it 'contains required fields' 

  end
end
