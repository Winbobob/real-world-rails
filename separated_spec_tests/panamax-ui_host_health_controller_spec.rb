require 'spec_helper'

describe HostHealthController do
  let(:fake_response) { double(:fake_response, overall: {}) }

  before do
    allow(HostHealth).to receive(:find).and_return(fake_response)
  end

  describe 'GET #index' do
    it 'uses HostHealth model' 

  end
end

