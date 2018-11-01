require 'spec_helper'

describe Gitlab::Ci::Pipeline::Chain::Build do
  set(:project) { create(:project, :repository) }
  set(:user) { create(:user) }
  let(:pipeline) { Ci::Pipeline.new }

  let(:variables_attributes) do
    [{ key: 'first', secret_value: 'world' },
     { key: 'second', secret_value: 'second_world' }]
  end
  let(:command) do
    Gitlab::Ci::Pipeline::Chain::Command.new(
      source: :push,
      origin_ref: 'master',
      checkout_sha: project.commit.id,
      after_sha: nil,
      before_sha: nil,
      trigger_request: nil,
      schedule: nil,
      project: project,
      current_user: user,
      variables_attributes: variables_attributes)
  end

  let(:step) { described_class.new(pipeline, command) }

  before do
    stub_repository_ci_yaml_file(sha: anything)
  end

  it 'never breaks the chain' 


  it 'fills pipeline object with data' 


  it 'sets a valid config source' 


  it 'returns a valid pipeline' 


  it 'does not persist a pipeline' 


  context 'when pipeline is running for a tag' do
    let(:command) do
      Gitlab::Ci::Pipeline::Chain::Command.new(
        source: :push,
        origin_ref: 'mytag',
        checkout_sha: project.commit.id,
        after_sha: nil,
        before_sha: nil,
        trigger_request: nil,
        schedule: nil,
        project: project,
        current_user: user)
    end

    before do
      allow_any_instance_of(Repository).to receive(:tag_exists?).with('mytag').and_return(true)

      step.perform!
    end

    it 'correctly indicated that this is a tagged pipeline' 

  end
end

