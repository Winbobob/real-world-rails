# frozen_string_literal: true
require 'spec_helper'

describe AutoDevops::DisableWorker, '#perform' do
  let(:user) { create(:user) }
  let(:project) { create(:project, :repository, :auto_devops) }
  let(:auto_devops) { project.auto_devops }
  let(:pipeline) { create(:ci_pipeline, :failed, :auto_devops_source, project: project, user: user) }

  subject { described_class.new }

  before do
    stub_application_setting(auto_devops_enabled: true)
    auto_devops.update_attribute(:enabled, nil)
  end

  it 'disables auto devops for project' 


  context 'when project owner is a user' do
    let(:owner) { create(:user) }
    let(:namespace) { create(:namespace, owner: owner) }
    let(:project) { create(:project, :repository, :auto_devops, namespace: namespace) }

    it 'sends an email to pipeline user and project owner' 

  end

  context 'when project does not have owner' do
    let(:group) { create(:group) }
    let(:project) { create(:project, :repository, :auto_devops, namespace: group) }

    it 'sends an email to pipeline user' 

  end

  context 'when pipeline is not related to a user and project does not have owner' do
    let(:group) { create(:group) }
    let(:project) { create(:project, :repository, :auto_devops, namespace: group) }
    let(:pipeline) { create(:ci_pipeline, :failed, project: project) }

    it 'does not send an email' 

  end
end

