require 'spec_helper'

describe VersionsController, :type => :controller do
  before(:each) do
    VersionsController.class_eval {class_variable_set :@@version, nil}
  end

  context 'routing' do
    it 'should route GET /version to VersionsController#show' 


    it 'should only check the VERSION file once' 

  end

  context 'with a VERSION file in the Rails root' do
    let(:version) { '123' }
    before do
      allow(File).to receive(:exists?).with(VersionsController::VERSION_PATH).and_return(true)
      allow(File).to receive(:read).with(VersionsController::VERSION_PATH).and_return(version)
    end

    it 'returns the current version' 

  end

  context 'with no VERSION file in the Rails root' do
    before do
      allow(File).to receive(:exists?).with(VersionsController::VERSION_PATH).and_return(false)
    end

    it 'returns the current version' 

  end
end

