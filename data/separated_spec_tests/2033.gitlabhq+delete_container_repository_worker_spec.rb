# frozen_string_literal: true

require 'spec_helper'

describe DeleteContainerRepositoryWorker do
  let(:registry) { create(:container_repository) }
  let(:project) { registry.project }
  let(:user) { project.owner }

  subject { described_class.new }

  describe '#perform' do
    it 'executes the destroy service' 


    it 'does not raise error when user could not be found' 


    it 'does not raise error when registry could not be found' 

  end
end

