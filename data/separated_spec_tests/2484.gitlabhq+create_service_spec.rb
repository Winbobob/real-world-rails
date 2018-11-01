require 'spec_helper'

describe Tags::CreateService do
  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:user) { create(:user) }
  let(:service) { described_class.new(project, user) }

  describe '#execute' do
    it 'creates the tag and returns success' 


    context 'when target is invalid' do
      it 'returns an error' 

    end

    context 'when tag already exists' do
      it 'returns an error' 

    end

    context 'when pre-receive hook fails' do
      it 'returns an error' 

    end
  end
end

