require 'spec_helper'

describe Gitlab::LegacyGithubImport::LabelFormatter do
  let(:project) { create(:project) }
  let(:raw) { double(name: 'improvements', color: 'e6e6e6') }

  subject { described_class.new(project, raw) }

  describe '#attributes' do
    it 'returns formatted attributes' 

  end

  describe '#create!' do
    context 'when label does not exist' do
      it 'creates a new label' 

    end

    context 'when label exists' do
      it 'does not create a new label' 

    end
  end
end

