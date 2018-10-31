require 'spec_helper'

describe StatusEntity do
  let(:entity) { described_class.new(status) }

  let(:status) do
    Gitlab::Ci::Status::Success.new(double('object'), double('user'))
  end

  before do
    allow(status).to receive(:has_details?).and_return(true)
    allow(status).to receive(:details_path).and_return('some/path')
  end

  describe '#as_json' do
    subject { entity.as_json }

    it 'contains status details' 


    it 'contains a dev namespaced favicon if dev env' 


    it 'contains a canary namespaced favicon if canary env' 

  end
end

