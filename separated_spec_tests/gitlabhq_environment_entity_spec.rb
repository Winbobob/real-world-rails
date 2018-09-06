require 'spec_helper'

describe EnvironmentEntity do
  let(:entity) do
    described_class.new(environment, request: double)
  end

  let(:environment) { create(:environment) }
  subject { entity.as_json }

  it 'exposes latest deployment' 


  it 'exposes core elements of environment' 


  it 'exposes folder path' 


  context 'metrics disabled' do
    before do
      allow(environment).to receive(:has_metrics?).and_return(false)
    end

    it "doesn't expose metrics path" 

  end

  context 'metrics enabled' do
    before do
      allow(environment).to receive(:has_metrics?).and_return(true)
    end

    it 'exposes metrics path' 

  end
end

