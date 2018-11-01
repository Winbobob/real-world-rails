require 'spec_helper'

describe Ci::EnsureStageService, '#execute' do
  set(:project) { create(:project) }
  set(:user) { create(:user) }

  let(:stage) { create(:ci_stage_entity) }
  let(:job) { build(:ci_build) }

  let(:service) { described_class.new(project, user) }

  context 'when build has a stage assigned' do
    it 'does not create a new stage' 

  end

  context 'when build does not have a stage assigned' do
    it 'creates a new stage' 

  end

  context 'when build is invalid' do
    it 'does not create a new stage' 

  end

  context 'when new stage can not be created because of an exception' do
    before do
      allow(Ci::Stage).to receive(:create!)
        .and_raise(ActiveRecord::RecordNotUnique.new('Duplicates!'))
    end

    it 'retries up to two times' 

  end
end

