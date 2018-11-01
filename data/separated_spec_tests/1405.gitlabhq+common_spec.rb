require 'spec_helper'

describe Gitlab::Ci::Status::Stage::Common do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:pipeline) { create(:ci_empty_pipeline, project: project) }

  let(:stage) do
    build(:ci_stage, pipeline: pipeline, name: 'test')
  end

  subject do
    Class.new(Gitlab::Ci::Status::Core)
      .new(stage, user).extend(described_class)
  end

  it 'does not have action' 


  it 'links to the pipeline details page' 


  context 'when user has permission to read pipeline' do
    before do
      project.add_maintainer(user)
    end

    it 'has details' 

  end

  context 'when user does not have permission to read pipeline' do
    it 'does not have details' 

  end
end
