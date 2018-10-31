require 'spec_helper'

describe DetectRepositoryLanguagesWorker do
  set(:project) { create(:project) }
  let(:user) { project.owner }

  subject { described_class.new }

  describe '#perform' do
    it 'calls de DetectRepositoryLanguages service' 


    context 'when invalid ids are used' do
      it 'does not raise when the project could not be found' 


      it 'does not raise when the user could not be found' 

    end
  end
end

